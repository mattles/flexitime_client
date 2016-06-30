module FlexitimeClient
  class ResourceRequest
    attr_reader :params

    def initialize(resource:, params: {})
      @resource = resource
      @params = params
    end

    def path_with_params
      encoded_params = URI.encode_www_form(params)
      [resource.path, encoded_params].join("?")
    end

    private

    attr_reader :resource
  end
end
