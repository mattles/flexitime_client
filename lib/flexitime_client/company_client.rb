require 'json'
module FlexitimeClient
  class CompanyClient

    def initialize(company_code:, access_key:)
      @company_authorisation = CompanyAuthorisation.new(
        company_code: company_code,
        access_key: access_key
      )
      @http_client = HttpClient.new(authorisation: company_authorisation)
    end

    def employees
      request = ResourceRequest.new(resource: Resources::Employee)
      json_responce = http_client.get(resource_request: request)
      attributes = JSON.parse(json_responce)
      attributes.map { |a| Resources::Employee.new(attributes: a) }
    end

    def employee_times(employee_key:, from_date:, to_date:)
      request = ResourceRequest.new(resource: Resources::EmployeeTime, params: {
        employee_key: employee_key ,
        from_date: from_date.strftime("%Y%m%d"),
        to_date: to_date.strftime("%Y%m%d")

      })
      response = http_client.get(resource_request: request)
      attributes = parse_response(response: response) 
      attributes.map { |a| Resources::EmployeeTime.new(attributes: a) }
    end


    attr_reader :company_authorisation, :http_client

    private 

    def parse_response(response:)
      return [] if response.code == 404
      JSON.parse(response.body)
    end
  end
end
