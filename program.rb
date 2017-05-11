$LOAD_PATH << '.'

require 'student'

student = Student.new('Jack', 'Frost')

puts student.fullname


p student.instance_variable_get('@firstname')