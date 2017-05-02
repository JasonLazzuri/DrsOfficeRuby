require('spec_helper')


describe(Doctor)do
  describe(".all")do
    it('starts off with no doctors')do
      expect(Doctor.all()).to(eq([]))
    end
  end

  describe('#save') do
    it ("lets you save doctors to the database") do
      dr = Doctor.new({:name => "Dr. J",:specialty=> "general", :id => nil})
      dr.save()
      expect(Doctor.all()).to(eq([dr]))
    end
  end

  describe('.find') do
    it("") do
      test_dr = Doctor.new({:name => "House, MD", :specialty => "diagnostics ", :id => nil})
      test_dr.save()
      test_dr2 = Doctor.new({:name => "Dr. Watson", :specialty => "army surgeon", :id => nil})
      test_dr2.save()
      expect(Doctor.find(test_dr2.id())).to(eq(test_dr2))
    end
  end
end
