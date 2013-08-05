class Book

  attr_reader :title

  def title= title
    @title = title
    capitalize
  end

  private
  def capitalize 
    @title.gsub!(/(\S+)(?=\s?)/) do
      blacklist.include?($1.to_sym) ? $1 : $1.capitalize
    end
    capitalize_first_word
  end

  def blacklist
    @blacklist ||= [ :a, :an, :the, :and, :in, :of ]
  end

  def capitalize_first_word
    @title.sub!(/^\S*/) { |first_word| first_word.capitalize }
  end
end
