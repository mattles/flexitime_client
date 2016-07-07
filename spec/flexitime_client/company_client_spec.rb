require 'spec_helper'

module FlexitimeClient
  describe CompanyClient do
    describe "#initialize" do
      it "creates company client" do
        company_client = CompanyClient.new(company_code: "code", access_key:"12345")
        expect(company_client).to be_a(CompanyClient)
      end
      it "has a company_authorisation" do
        company_client = CompanyClient.new(company_code: "code", access_key:"12345")
        expect(company_client.company_authorisation).to be_a(CompanyAuthorisation)
      end
    end

    describe "#employee_times" do
      context "when repsonse returns 404 not found" do
        it "returns an empty array" do
          response = double("Response", code: 404, body:  "{  }")
          http_client_double = instance_double(HttpClient, get: response)
          allow(HttpClient).to receive(:new) { http_client_double }
          company_client = CompanyClient.new(company_code: nil, access_key: nil)
          result = company_client.employee_times(
            employee_key: 3, from_date: DateTime.new,to_date: DateTime.new  
          )
          expect(result).to eq([])
        end
      end

      context "when repsonse returns success" do
        it "returns an array on employee time resources" do
          json_response = [ { start_time: DateTime.now } ].to_json
          response = double("Response", code: 200, body: json_response)
          http_client_double = instance_double(HttpClient, get: response)
          allow(HttpClient).to receive(:new) { http_client_double }
          company_client = CompanyClient.new(company_code:  nil, access_key: nil)
          expect(company_client.employee_times(employee_key: 3, from_date: DateTime.new,to_date: DateTime.new )).to include(a_kind_of(Resources::EmployeeTime))
        end
      end
    end

    describe "#employees" do
      it "returns an array on employee resources" do
        json_response = [ { first_name: "matt" } ].to_json
        http_client_double = instance_double(HttpClient, get: json_response)
        allow(HttpClient).to receive(:new) { http_client_double }
        company_client = CompanyClient.new(company_code: "code", access_key:"12345")
        expect(company_client.employees).to include(a_kind_of(Resources::Employee))
      end
    end
  end
end
