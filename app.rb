require 'sinatra'
require 'json'
require 'open-uri'
# API KEY = a329ae0dc2be2fdc551afc41de40704f
class API < Sinatra::Base
  @@weather_city = {}

  get '/' do
    @@weather_city.each do |city_name, weather_string|
      data = open("http://api.openweathermap.org/data/2.5/weather?q=#{city_name}&APPID=a329ae0dc2be2fdc551afc41de40704f") # API Key at the end
      parsed_data = JSON.parse(data.read)
      @@weather_city[city_name] = parsed_data["weather"].first["main"]
    end
    @list_of_cities_and_weather = @@weather_city
    erb(:index)
  end

  post '/' do
    @city  = params[:city]
    @@weather_city[@city] = nil
    redirect "/"
  end

end

