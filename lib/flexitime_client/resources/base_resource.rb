module FlexitimeClient
  module Resources
    class BaseResource
      def initialize(attributes:)
        @attributes = attributes
        build
      end

      protected

      def build
        attr = attributes.select {  |key| self.respond_to?("#{key}=")}
        attr.each { |key,value | self.send("#{key}=", value)  }
      end

      def parse_date(string:)
        DateTime.strptime(string, "%Y%m%d")
      end

      private


      attr_reader :attributes
    end
  end
end
