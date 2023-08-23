require 'net/http'
require 'json'

class Movie
  BASE_URL = 'https://jsonmock.hackerrank.com/api/moviesdata'

  def self.get_titles(query)
    search(query).collect { |movie| movie['Title'] }.sort
  end

  def self.search(query)
    movies_data = []
    page = 1

    loop do
      response = call_endpoint('/search', Title: query, page: page)
      break if response[:error]
      movies_data.concat(response['data'])
      page += 1
      break if page > response['total_pages']
    end

    return movies_data
  end

  private

  def self.call_endpoint(endpoint, **params)
    begin
      uri = URI(BASE_URL + endpoint)
      uri.query = URI.encode_www_form(params)
      response = Net::HTTP.get_response(uri)

      return JSON.parse(response.body)
    rescue Exception => e
      return { error: e.original_message }
    end
  end
end

print 'Enter movie title to search: '
query = gets.chomp
p Movie.get_titles(query)
