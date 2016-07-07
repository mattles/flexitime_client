require 'spec_helper'

module FlexitimeClient
  module Resources
    describe EmployeeTime do
      describe "#start_time" do
        it "is a datetime object" do
          start_time = "2016-06-30 18:15:00.000"
          employee_time = EmployeeTime.new(attributes: { start_time: start_time}) 
          expect(employee_time.start_time).to be_a(DateTime)
        end

        it "has a nz timezone" do
          start_time = "2016-06-30 18:15:00.000"
          employee_time = EmployeeTime.new(attributes: { end_time: start_time}) 
          expect(employee_time.end_time.zone).to eq("+12:00")
        end
      end
      describe "#end_time" do
        it "has a nz timezone" do
          start_time = "2016-06-30 18:15:00.000"
          employee_time = EmployeeTime.new(attributes: { end_time: start_time}) 
          expect(employee_time.end_time.zone).to eq("+12:00")
        end

        it "is a datetime object" do
          start_time = "2016-06-30 18:15:00.000"
          employee_time = EmployeeTime.new(attributes: { end_time: start_time}) 
          expect(employee_time.end_time).to be_a(DateTime)
        end
      end
    end
  end
end
