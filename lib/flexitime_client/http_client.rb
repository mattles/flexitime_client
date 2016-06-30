require "net/http"
require "uri"
require "json"

module FlexitimeClient
  class HttpClient
    FLEXITIME_URL= "https://api.flexitime.co.nz/"

    def initialize(authorisation:)
      @authorisation = authorisation
      @uri = URI.parse(FLEXITIME_URL)
    end

    def get(resource_request:)
      http = Net::HTTP.new(uri.host, uri.port)
      request = Net::HTTP::Get.new(resource_request.path_with_params)
      http.use_ssl = true
      request.basic_auth(
        authorisation.username,
        authorisation.password
      )
      response = http.request(request)
      response.body
    end

    private

    attr_reader :uri, :authorisation
  end
end
