module FlexitimeClient
  module Resources
    class Employee < BaseResource
      def self.jath
        "/employee.json"
      end

      attr_accessor :first_name, :last_name, :employee_key
    end
  end
end
