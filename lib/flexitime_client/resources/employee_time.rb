module FlexitimeClient
  module Resources
    class EmployeeTime < BaseResource
      def self.path
        "/employee/time.json"
      end

      attr_accessor :start_time, :end_time, :duration
    end
  end
end
