require 'httparty'

def get_current_time(area, location)
  response = HTTParty.get("http://worldtimeapi.org/api/timezone/#{area}/#{location}")
  data = JSON.parse(response.body)
  return data['datetime']
end

def display_output(area, location, datetime)
  puts "The current time in #{area}/#{location} is #{datetime}"
end

area = 'America'
location = 'Chicago'

datetime = get_current_time(area, location)

display_output(area, location, datetime)
