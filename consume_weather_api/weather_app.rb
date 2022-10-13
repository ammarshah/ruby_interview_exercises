require 'dotenv/load' # Load the environment variable specified in .env file
require_relative 'apis/visual_crossing/client' # Load the Visual Crossing API client

class WeatherApp
    attr_reader :client

    def initialize(client:, api_key:)
        @client = Module.const_get(client)::Client.new(api_key) # Convert the passed client name string to its class
                                                                # name constant and initialize an instance of it
    end

    def get_data_for_last30days(city:, **options)
        include = options[:include].join(',') if options[:include]
        elements = options[:elements].join(',') if options[:elements]

        client.last30days(location: city, include: include, elements: elements)
    end

    def resolve_required_data_keys(data:, required_data_keys:)
        resolved_data_hash = {}

        required_data_keys.each do |key|
            if self.class.private_method_defined?(key) # For every required data key
                                                       # there should be a private method defined
                
                resolved_data_hash[key] = send(key, data) # So we call the method by the key name
                                                          # and save the resolved value in a new hash
            end
        end
        resolved_data_hash
    end

    private

    def average(array_of_numbers)
        return nil if array_of_numbers.empty?
        (array_of_numbers.sum.to_f / array_of_numbers.size.to_f).round(1)
    end

    def median(array_of_numbers)
        return nil if array_of_numbers.empty?
        sorted = array_of_numbers.sort
        mid = (sorted.length - 1) / 2.0
        (sorted[mid.floor] + sorted[mid.ceil]) / 2.0
    end

    def city(data)
        data["resolvedAddress"]
    end

    def wind_average(data)
        array_of_windspeeds = data["days"].map {|day| day["windspeed"]}
        average(array_of_windspeeds)
    end

    def wind_median(data)
        array_of_windspeeds = data["days"].map {|day| day["windspeed"]}
        median(array_of_windspeeds)
    end

    def temp_average(data)
        array_of_temps = data["days"].map {|day| day["temp"]}
        average(array_of_temps)
    end

    def temp_median(data)
        array_of_temps = data["days"].map {|day| day["temp"]}
        median(array_of_temps)
    end
end