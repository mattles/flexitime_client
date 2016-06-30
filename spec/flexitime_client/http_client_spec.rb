require 'spec_helper'

module FlexitimeClient
  describe HttpClient do
    describe "#get" do
      it "returns the responce body" do
        body = "THe response body"
        stub_request(:get, "https://api.flexitime.co.nz/employee.json")
          .to_return(body: body, status: 200)
        company_auth = CompanyAuthorisation.new(
          company_code: "12345",
          access_key: "1234"
        )
        http_client = HttpClient.new(authorisation: company_auth)
        resource_double = double("Resource", path_with_params: "/employee.json")
        expect(http_client.get(resource_request: resource_double)).to eq(body)
      end

      it "correclty call the flexitime api" do
        access_key = "accesskey"
        company_code = "company_auth"
        stub = stub_request(:get, "https://api.flexitime.co.nz/employee.json")
          .with(basic_auth: [company_code, access_key])
          .with(query: { employee_key: "12345"})
        company_auth = CompanyAuthorisation.new(
          company_code: company_code,
          access_key: access_key
        )
        resource_request = instance_double(ResourceRequest,
          path_with_params: "/employee.json?employee_key=12345"
        )
        http_client = HttpClient.new(authorisation: company_auth)
        http_client.get(resource_request: resource_request)
        expect(stub).to have_been_requested
      end
    end
  end
end
