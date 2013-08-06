class Temperature

  FAHRENHEIT = :f
  CELSIUS = :c

  attr_accessor :degree
  attr_reader :measurement

  def measurement= measurement
    if measurement == FAHRENHEIT or measurement == CELSIUS
      @measurement = measurement 
    end
  end

  def initialize hash
    @degree = (hash[FAHRENHEIT] or hash[CELSIUS])
    @measurement = hash.key degree
  end

  def in_fahrenheit
    measurement == FAHRENHEIT ? degree : degree_to_celsius
  end

  def degree_to_celsius
    degree * 9/5.0 + 32
  end
  private :degree_to_celsius

  def in_celsius
    measurement == CELSIUS ? degree : degree_to_fahrenheit
  end

  def degree_to_fahrenheit
    (degree - 32) * 5/9
  end
  private :degree_to_fahrenheit

  class << self

    def from_celsius degrees
      Temperature.new CELSIUS => degrees
    end

    def from_fahrenheit degrees
      Temperature.new FAHRENHEIT => degrees
    end
  end
end

class Celsius < Temperature

  def initialize degree
    @measurement = Temperature::CELSIUS
    @degree = degree
  end
end

class Fahrenheit < Temperature

  def initialize degree
    @measurement = Temperature::FAHRENHEIT
    @degree = degree
  end
end
