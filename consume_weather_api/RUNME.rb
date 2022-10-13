# Test: Consuming Api

# Visual Crossing has a free weather API. You can sign up for a free account to get an access
# token. Here is the documentation of the api (https://www.visualcrossing.com/resources/documentation/weather-api/timeline-weather-api/).

# Task:

# You have to write a ruby program that gets the daily temperature and wind speed for the last
# 30 days and outputs on the console (stdout) the average and the median temperature for
# that period for the following cities:

# Copenhagen, Denmark
# Lodz, Poland
# Brussels, Belgium
# Islamabad, Pakistan

# Average is consisting of temp fields [54.8,53.6,51.8,51.2] so 4 entries have 52.85 average.

# The median is the middle of values when sorted, e.g. the median of [22.2, 54.8, 53.6, 51.8,
# 66.6] is 53.6

# You can read documentation to call suitable api to get results. For temperature you get a
# `temp` in the returned JSON.

# datetime: 2017-02-03,
# datetimeEpoch: 1486062000,
# tempmax: 62.6,
# tempmin: 48.5,
# temp: 54.8,

# The result should be a simple console log showing a weather/wind report for the last 30 days for
# each city. There should be one line of output for each city, so four lines in this case.

# city              wind_avg      wind_median      temp_avg      temp_median
# Lodz, Poland      4.7           4.2              54.8          53.6

require_relative 'weather_app'
require 'terminal-table'

def print_weather_data_to_console(cities)
    weather_app = WeatherApp.new(client: 'VisualCrossing', api_key: ENV['VC_API_KEY'])
    required_data_keys = [:city, :wind_average,  :wind_median, :temp_average, :temp_median]
    rows = []
    
    cities.each do |city|
        last30days_data = weather_app.get_data_for_last30days(city: city, include: [:days], elements: [:temp, :windspeed])
        resolved_data_hash = weather_app.resolve_required_data_keys(data: last30days_data, required_data_keys: required_data_keys)
        rows << resolved_data_hash.values
    end
    
    table = Terminal::Table.new title: "Last 30 Days Weather Data", headings: required_data_keys, rows: rows
    puts table
end

cities = ["Copenhagen, Denmark", "Lodz, Poland", "Brussels, Belgium", "Islamabad, Pakistan"]
print_weather_data_to_console(cities)