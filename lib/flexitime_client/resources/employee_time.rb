module FlexitimeClient
  module Resources
    class EmployeeTime < BaseResource
      def self.path
        "/employee/time.json"
      end

      def start_time=(string_value)
        @start_time = DateTime.parse(string_value + "NZT")
      end
      
      def end_time=(string_value)
        @end_time = DateTime.parse(string_value + "NZT") 
      end

      attr_reader :start_time, :end_time
      attr_accessor :duration
    end
  end
end
