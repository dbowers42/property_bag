$LOAD_PATH << '.'

require 'property_bag'

class Student < PropertyBag
  prop :firstname, :lastname

  def initialize(firstname, lastname)
    self.firstname = firstname
    self.lastname = lastname
  end

  def fullname
    "#{self.firstname} #{self.lastname}"
  end
end

student = Student.new('Jack', 'Frost')

puts student.fullname