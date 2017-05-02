class Doctor
  attr_reader(:name, :specialty, :id)
  define_method(:initialize) do |attributes|
    @name = attributes.fetch(:name)
    @specialty = attributes.fetch(:specialty)
    @id = attributes.fetch(:id)
  end

  define_singleton_method(:all) do
    returned_dr = DB.exec("SELECT * FROM doctors")
    drs = []
    returned_dr.each() do |dr|
      name = dr.fetch("name")
      specialty = dr.fetch('specialty')
      id = dr.fetch('id').to_i()
      drs.push(Doctor.new({:name => name,:specialty => specialty, :id => id}))
    end
    drs
  end

  define_method(:save)do
    result = DB.exec("INSERT INTO doctors (name, specialty) VALUES ('#{@name}', '#{@specialty}') RETURNING id;")
    @id = result.first().fetch('id').to_i()
  end

  define_method(:==) do |another_dr|
    self.name().==(another_dr.name()).&(self.id().==(another_dr.id()))
  end
end
