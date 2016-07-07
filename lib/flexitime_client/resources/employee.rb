module FlexitimeClient
  module Resources
    class Employee < BaseResource
      def self.path
        "/employee.json"
      end

      attr_accessor :first_name, :last_name, :employee_key, :normal_rate
    end
  end
end
