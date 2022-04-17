COMMENTS_API_ENDPOINT = "https://jsonplaceholder.typicode.com/comments"

# Get all the comments by the post_id=?
def get_comments_by_post_id(post_id)
    response = fetch_comments_api_response(COMMENTS_API_ENDPOINT)
    
    if response[:status] == 200
        response[:data].select { |obj| obj["postId"] == post_id }
    else
        "Something went wrong. Endpoint responded with status \"#{response[:status]}\" and message \"#{response[:message]}\"."
    end
end

def fetch_comments_api_response(endpoint)
    require 'json'
    
    # We can use either Net::HTTP or Faraday to get API response
    response = call_endpoint_using_net_http(endpoint)
    # response = call_endpoint_using_faraday(endpoint)

    status = response.respond_to?(:code) ? response.code.to_i : response.status
    message = response.respond_to?(:message) ? response.message : response.reason_phrase
    data = status == 200 ? JSON.parse(response.body) : []

    return { status: status, message: message, data: data }
end

def call_endpoint_using_net_http(endpoint)
    require 'uri'
    require 'net/http'
    url = URI(endpoint)
    http = Net::HTTP.new(url.host, url.port)
    http.use_ssl = true
    request = Net::HTTP::Get.new(url)
    response = http.request(request)
end

def call_endpoint_using_faraday(endpoint)
    require 'faraday'
    response = Faraday.get(endpoint)
end

post_id = 2
puts get_comments_by_post_id(post_id)
