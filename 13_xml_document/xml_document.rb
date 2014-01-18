class XmlDocument

  attr_reader :root
  
  def root= tag
    @root ||= tag
  end

  def method_missing name, *args
    root = tag = XmlTag.new name 
    select_attributes(args).each do |name, value|
      tag.attributes << XmlAttribute.new(name, value)
    end
    tag.child = yield if block_given?
    tag.to_s
  end

  private
  def select_attributes args
    attributes = Hash.new
    args.select { |args| args.respond_to?(:[]) }.each do |attribute|
      attributes.merge! attribute
    end
    attributes
  end
end

class XmlTag

  attr_reader :name
  attr_accessor :child

  def attributes
    @attributes
  end

  def initialize name
    @name, @attributes = name, Array.new
  end

  def to_s
    if self_closing?
      "<#{name}/>"
    elsif self_closing?
      "<#{name} #{attributes.join(' ')}/>"
    end
  end

  private
  def attributeless?
    attributes.empty?
  end

  def self_closing?
    attributeless? and child.nil?
  end
end

class XmlAttribute

  attr_reader :name, :value

  def initialize name, value
    @name, @value = name, value
  end

  def to_s
    "#{name}='#{value}'"
  end
end
