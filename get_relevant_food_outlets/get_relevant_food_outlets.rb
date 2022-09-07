#!/bin/ruby

require 'json'
require 'stringio'
require 'faraday'


# Hacker Rank Test
#
# Get all the food outlets in the city with an estimated cost of 2 persons is below or equal to `max_cost`.
#
# Complete the 'get_relevant_food_outlets' function below.
#
# URL for cut and paste
# https://jsonmock.hackerrank.com/api/food_outlets?city=<city>&page=<pageNumber>
#
# The function is expected to return an array of strings.
# The function accepts a city argument (String) and max_cost argument(Integer).
#
# EXAMPLE INPUT:
# city = "Denver"
# max_cost = 50
#
# EXPECTED OUTPUT:
# BKC DIVE
# Vedge
#


def get_relevant_food_outlets(city, max_cost)
    response = get_all_food_outlets_in_city(city)
    relevant_outlets = response.select { |obj| obj["estimated_cost"] <= max_cost }
    food_outlets = relevant_outlets.map {|obj| obj["name"]}
    return food_outlets
end

def get_all_food_outlets_in_city(city)
    food_outlets_endpoint = "https://jsonmock.hackerrank.com/api/food_outlets?city=#{city}"
    data = []
    response = call_endpoint(food_outlets_endpoint)
    data += response["data"] # First page response
    
    total_pages = response["total_pages"] - 1 # Because first page response saved already
    
    total_pages.times do |counter| # counter starts with 0
        page_number = counter + 2
        food_outlets_endpoint = "https://jsonmock.hackerrank.com/api/food_outlets?city=#{city}&page=#{page_number}"
        response = call_endpoint(food_outlets_endpoint)
        data += response["data"]
    end
    return data
end

def call_endpoint(endpoint)
    response = Faraday.get(endpoint)
    return JSON.parse(response.body)
end

# Set variables
city = "Denver"
max_cost = 50

# Call the function
puts get_relevant_food_outlets(city, max_cost)