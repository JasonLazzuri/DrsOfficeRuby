class Patient
  attr_reader(:name, :birthday, :id)
  define_method(:initialize) do |attributes|
    @name = attributes.fetch(:name)
    @birthday = attributes.fetch(:birthday)
    @id = attributes.fetch(:id)
  end

  define_singleton_method(:all) do
    returned_patient = DB.exec("SELECT * FROM patients")
    patients = []
    returned_patient.each() do |patient|
      name = patient.fetch("name")
      birthday = patient.fetch("birthday").to_i()
      id = patient.fetch("id").to_i()
      patients.push(Patient.new({:name => name, :birthday => birthday, :id => id}))
    end
    patients
  end

  define_method(:save) do
    result = DB.exec("INSERT INTO patients (name, birthday) VALUES ('#{@name}', '#{@birthday}') RETURNING id;")
    @id =  result.first().fetch('id').to_i()
  end

  define_method(:==) do |another_patient|
    self.name().==(another_patient.name()).&(self.id().==(another_patient.id()))
