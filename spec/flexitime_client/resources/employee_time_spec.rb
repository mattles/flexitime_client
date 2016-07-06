require 'spec_helper'

module FlexitimeClient
  module Resources
    describe EmployeeTime do
      describe "#start_time" do
        it "is a datetime object" do
          # 23 June 2016
          start_time = "201606023"
          employee_time = EmployeeTime.new(attributes: { start_time: start_time}) 
          expect(employee_time.start_time).to be_a(DateTime)
        end
      end
      describe "#end_time" do
        it "is a datetime object" do
          # 23 June 2016
          start_time = "201606023"
          employee_time = EmployeeTime.new(attributes: { end_time: start_time}) 
          expect(employee_time.end_time).to be_a(DateTime)
        end
      end
    end
  end
end
