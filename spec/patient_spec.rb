require('spec_helper')


describe(Patient) do
  describe('.all')do
    it('starts off with no patients')do
      expect(Patient.all()).to(eq([]))
    end
  end

  describe('#save') do
    it('lets you save patients to the database')do
      patient = Patient.new({:name => "John Doe", :birthday => "1991-01-01", :id => nil})
      patient.save()
      expect(Patient.all()).to(eq([patient]))
    end
  end

end
