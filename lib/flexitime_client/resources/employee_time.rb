module FlexitimeClient
  module Resources
    class EmployeeTime < BaseResource
      def self.path
        "/employee/time.json"
      end

      def start_time=(string_value)
        @start_time = parse_date(string: string_value)
      end
      
      def end_time=(string_value)
        @end_time = parse_date(string: string_value)
      end

      attr_reader :start_time, :end_time
      attr_accessor :duration
    end
  end
end
