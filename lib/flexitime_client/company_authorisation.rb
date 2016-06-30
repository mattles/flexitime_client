module FlexitimeClient
  class CompanyAuthorisation
    attr_reader :company_code, :access_key

    alias_method :password, :access_key
    alias_method :username, :company_code

    def initialize(company_code:, access_key:)
      @company_code = company_code
      @access_key = access_key
    end
  end
end

