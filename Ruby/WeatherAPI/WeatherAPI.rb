require 'net/http'
require 'uri'
require 'json'

#API KEY: ae0e31289f9d4053b2b173043250206
#API URL: http://api.weatherapi.com/v1/current.json?key=ae0e31289f9d4053b2b173043250206

#Metodo para obtener el clima actual de una ciudad
  #Configurar la URL de la API y la ciudad deseada

#Metodo para obtener el clima de la semana en una ciudad

#Metodo para configurar la unidad de temperatura y viento

#Metodo para ver el historial de ciudades consultadas


def get_weather(city)

  url = URI.parse("http://api.weatherapi.com/v1/current.json?key=ae0e31289f9d4053b2b173043250206&q=#{city}&aqi=no")
  
  res = Net::HTTP.get(url)

  data = JSON.parse(res)

  if data['error']
    puts "Error: #{data['error']['message']}"
    return
  end

  puts "The current Weather in #{city} is:"
  puts "Temperature: #{data['current']['temp_c']}°C"
  puts "Feels like: #{data['current']['feelslike_c']}°C"
  print "Condition: #{data['current']['condition']['text']}"
  puts "Wind Speed: #{data['current']['wind_kph']} kph"
  puts "Humidity: #{data['current']['humidity']}%"
  puts "Visibility: #{data['current']['vis_km']} km"

  puts "Last Updated: #{data['current']['last_updated']}"
end

def get_weekly_weather(city)

  url = URI.parse("https://api.weatherapi.com/v1/forecast.json?key=ae0e31289f9d4053b2b173043250206&q=Mexico&aqi=no&days=7")
  res = Net::HTTP.get(url)

  data = JSON.parse(res)

  if data['error']
    puts "Error: #{data['error']['message']}"
    return
  end

  puts "This week's forecast #{city} is:"
  
  data['forecast']['forecastday'].each do |day|
    puts "Fecha: #{day['date']}, Max: #{day['day']['maxtemp_c']}°C, Min: #{day['day']['mintemp_c']}°C, Avg: #{day['day']['avgtemp_c']}°C"
  end

end

def set_city()

  puts "Enter the city name: "
    city = gets.chomp.strip

    if city.empty?
      puts "Error: City cannot be empty, try again."
    end
  
    return city

end

def menu()
  puts "------------ Weather API ------------"
  puts "1. Get current weather"
  puts "2. Get weekly weather forecast"
  puts "3. Settings"
  puts "4. View history of cities"
  puts "5. Exit"
  puts "-------------------------------------"
  puts "Select an option: "

  option = gets.chomp.to_i

  case option
  when 1
    city = set_city()

    if !city.empty?
      get_weather(city)
    end

  when 2
    city = set_city()

    if !city.empty?
      get_weekly_weather(city)
    end

  when 3
    puts "This feature is not implemented yet."
  when 4
    puts "This feature is not implemented yet."
  when 5
    puts "Exiting the program. Goodbye!"
    exit
  else
    puts "Invalid option. Please try again."
  end
end



# Main loop to keep the program running
loop do
  menu()
end

  