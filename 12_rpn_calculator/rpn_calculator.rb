class RPNCalculator

  def value
    paramerter_stack.last
  end

  def push number
    paramerter_stack.push number
  end

  def paramerter_stack
    @param_stack ||= Array.new
  end
  private :paramerter_stack

  def plus
    push_operation_result :+
  end

  def minus
    push_operation_result :-
  end

  def divide
    push_operation_result :fdiv
  end

  def times
    push_operation_result :*
  end

  def tokens string
    string.split(' ').map do |token| 
      token.to_i == 0 ? token.to_sym : token.to_i
    end
  end

  def evaluate string
    tokens(string).each do |token|
      Operation.new(token).operate self
    end
    value
  end

  private
  def push_operation_result operator
    raise InvalidOperationError.new "calculator is empty" if paramerter_stack.empty?
    push apply operator
  end

  def apply operator
    remove_paramers.reduce operator
  end

  def remove_paramers
    paramerter_stack.pop 2
  end

end

class InvalidOperationError < Exception
end

class Operation

  OPERATOR_EQUIVALENCE = { :+ => :plus, :- => :minus, :* => :times, :/ => :divide }

  def initialize operator
    @operator = operator
  end

  def operate calculator
    return calculator.public_send equivalent if has_equivalent?
    calculator.push @operator
  end

  private
  def equivalent
    OPERATOR_EQUIVALENCE[@operator]
  end

  def has_equivalent?
    OPERATOR_EQUIVALENCE.include? @operator
  end
end
