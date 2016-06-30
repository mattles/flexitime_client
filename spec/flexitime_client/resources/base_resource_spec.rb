require "spec_helper"

module FlexitimeClient
  module Resources
    describe BaseResource do
      class DummyResource < BaseResource
        attr_accessor :first_name, :last_name
      end

      describe "#initialize" do
        it "sets the attributes" do
          attributes = { first_name: "Matt", last_name: "Hunter" }
          employee = DummyResource.new(attributes: attributes)
          expect(employee.first_name).to eq(attributes[:first_name])
          expect(employee.last_name).to eq(attributes[:last_name])
        end
      end
    end
  end
end
