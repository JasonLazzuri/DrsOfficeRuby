require('spec_helper')


describe(Doctor)do
  describe(".all")do
    it('starts off with no doctors')do
      expect(Doctor.all()).to(eq([]))
    end
  end

  describe('#save') do
    it ("lets you save doctors to the database") do
      dr = Doctor.new({:name => "Dr. J",:specialty=> "general", :id => nil,})
      dr.save()
      expect(Doctor.all()).to(eq([dr]))
    end
  end
end
