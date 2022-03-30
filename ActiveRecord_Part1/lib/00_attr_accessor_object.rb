class AttrAccessorObject
  def self.my_attr_accessor(*names)
    # ...
    names.each do |name| #for each name in the arguments
      define_method(name) do # define a getter for each name
        instance_variable_get("@#{name}") 
        #instance_variable_get(@symbol)
      end

      define_method("#{name}=") do |value| #
        instance_variable_set("@#{name}",value)

      end
  end

  end
end


class Dog < AttrAccessorObject
  self.my_attr_accessor(:fur)
  def initialize(fur)
    @fur = fur
  end
end

a = Dog.new("curly")
a.fur