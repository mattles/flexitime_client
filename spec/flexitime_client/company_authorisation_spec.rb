require 'spec_helper'

module FlexitimeClient
  describe CompanyAuthorisation do
    describe "#username" do
      it "returns the access_key" do
        company_code = "company_code"
        company_authorisation = CompanyAuthorisation.new(
          company_code: company_code, 
          access_key: "1234567"
        )
        expect(company_authorisation.username).to eq(company_code)
      end
    end
    describe "#password" do
      it "returns the access_key" do
        access_key = "1234567"
        company_authorisation = CompanyAuthorisation.new(
          company_code: "1234", 
          access_key: access_key
        )
        expect(company_authorisation.password).to eq(access_key)
      end
    end
  end
end
