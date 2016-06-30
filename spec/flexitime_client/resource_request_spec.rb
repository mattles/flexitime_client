require 'spec_helper'

module FlexitimeClient
  describe ResourceRequest do
    describe "#path_with_params" do
      it "returns the resource path" do
        resource_double = double("Resource", path: "/resource.json")
        resource_request = ResourceRequest.new(resource: resource_double)
        expect(resource_request.path_with_params).to eq("/resource.json?")
      end

      it "adds the query params correctly to the path" do
        params = { key: "123", id: "12345" }
        resource_double = double("Resource", path: "/resource.json")
        resource_request = ResourceRequest.new(resource: resource_double, params: params)
        expect(resource_request.path_with_params).to eq("/resource.json?key=123&id=12345")
      end
    end
  end
end
