class PropertyBag
  def self.prop(*fields)
    fields.each do |field|
      prop_reader(field)
      prop_writer(field)
    end
  end

  def self.prop_reader(*fields)
    fields.each do |field|
      define_method(field) do
        instance_variable_get("@#{field}")
      end
    end
  end

  def self.prop_writer(*fields)
    fields.each do |field|
      define_method("#{field}=") do |value|
        instance_variable_set("@#{field}", value)
      end
    end
  end
end