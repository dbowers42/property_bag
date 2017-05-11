require_relative 'spec_helper'
require_relative '../property_bag'

class TestReadWrite < PropertyBag
  prop :message

  def initialize(message)
    self.message = message
  end
end

class TestRead < PropertyBag
  prop_reader :message

  def initialize(message)
    @message = message
  end
end

class TestWrite < PropertyBag
  prop_writer :message
end

describe PropertyBag do
  describe '#prop' do
    it 'generates a reader method' do
      TestReadWrite.instance_methods.member?('message')
    end

    it 'generates a writer method' do
      TestReadWrite.instance_methods.member?('message=')
    end
  end

  describe '#prop_reader' do
    it 'generates a reader method' do
      TestRead.instance_methods.member?('message')
    end

    it 'returns the value of an instance variable' do
      obj = TestRead.new('hello')

      expect(obj.message).to be == obj.instance_variable_get('@message')
    end
  end

  describe '#prop_writer' do
    it 'generates a writer method' do
      TestWrite.instance_methods.member?('message=')
    end

    it 'writes a value to an instance variable' do
      obj = TestWrite.new
      obj.message = 'hello'

      expect(obj.instance_variable_get('@message')).to be == 'hello'
    end
  end
end