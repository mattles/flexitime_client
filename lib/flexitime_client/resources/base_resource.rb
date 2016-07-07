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

      private

      attr_reader :attributes
    end
  end
end
