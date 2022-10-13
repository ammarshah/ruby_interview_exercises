require 'faraday'
require 'oj'
require 'addressable/uri'

module VisualCrossing
    class Client
        API_ENDPOINT = 'https://weather.visualcrossing.com/VisualCrossingWebServices/rest/services/timeline'.freeze

        attr_reader :api_key

        def initialize(api_key = nil)
            @api_key = api_key
        end

        def last30days(location:, **options)
            options[:key] = api_key
            request(
                http_method: :get,
                endpoint: Addressable::URI.encode("#{location}/last30days"),
                params: options
            )
        end

        private

        def client
            @_client ||= Faraday.new(API_ENDPOINT) do |client|
                client.request :url_encoded
                client.adapter Faraday.default_adapter
            end
        end

        def request(http_method:, endpoint:, params: {})
            response = client.public_send(http_method, endpoint, params)
            Oj.load(response.body)
        end
    end
end