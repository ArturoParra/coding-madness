require 'net/http'
require 'uri'
require 'json'
require 'yaml'

#API KEY: ae0e31289f9d4053b2b173043250206
#API URL: http://api.weatherapi.com/v1/current.json?key=ae0e31289f9d4053b2b173043250206

#Metodo para obtener el clima actual de una ciudad
  #Configurar la URL de la API y la ciudad deseada

#Metodo para obtener el clima de la semana en una ciudad

#Metodo para configurar la unidad de temperatura y viento

#Metodo para ver el historial de ciudades consultadas

$settings_file = "settings.txt"
$history = []

def get_weather(city)

  url = URI.parse("http://api.weatherapi.com/v1/current.json?key=ae0e31289f9d4053b2b173043250206&q=#{city}&aqi=no")
  
  res = Net::HTTP.get(url)

  data = JSON.parse(res)

  if data['error']
    puts "Error: #{data['error']['message']}"
    return
  end

  settings = YAML.load_file($settings_file)

  t_unit = settings[:t_unit]
  s_unit = settings[:s_unit]
  d_unit = settings[:d_unit]

  puts "The current weather in #{city} is:"
  if t_unit.casecmp?("C")
    puts "Temperature: #{data['current']['temp_c']}°C"
    puts "Feels like: #{data['current']['feelslike_c']}°C"
  end
  if t_unit.casecmp?("F")
    puts "Temperature: #{data['current']['temp_f']}°F"
    puts "Feels like: #{data['current']['feelslike_f']}°F"
  end
  if !t_unit.casecmp?("C") && !t_unit.casecmp?("F")
    puts "Error: Wrong settings for temperature units"
  end

  puts "Condition: #{data['current']['condition']['text']}"

  if s_unit.casecmp?("k")
    puts "Wind Speed: #{data['current']['wind_kph']} kph"
  end
  if s_unit.casecmp?("m")
    puts "Wind Speed: #{data['current']['wind_mph']} mph"
  end
  if !s_unit.casecmp?("k") && !s_unit.casecmp?("m")
    puts "Error: Wrong settings for speed units"
  end

  puts "Humidity: #{data['current']['humidity']}%"

  if d_unit.casecmp?('k')
    puts "Visibility: #{data['current']['vis_km']} km"
  end
  if d_unit.casecmp?('m')
    puts "Visibility: #{data['current']['vis_miles']} mi"
  end
  if !d_unit.casecmp?("k") && !d_unit.casecmp?("m")
    puts "Error: Wrong settings for distance units"
  end

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

  settings = YAML.load_file($settings_file)

  puts "This week's forecast #{city} is:"
  
  data['forecast']['forecastday'].each do |day|
    if settings[:t_unit].casecmp?("C")
      puts "Fecha: #{day['date']}, Max: #{day['day']['maxtemp_c']}°C, Min: #{day['day']['mintemp_c']}°C, Avg: #{day['day']['avgtemp_c']}°C"
    end
    if settings[:t_unit].casecmp?("F")
      puts "Fecha: #{day['date']}, Max: #{day['day']['maxtemp_f']}°F, Min: #{day['day']['mintemp_f']}°F, Avg: #{day['day']['avgtemp_f']}°F"
    end
    if !settings[:t_unit].casecmp?("F") && !settings[:t_unit].casecmp?("C")
      puts "Error: wrong settings for temperature units"
    end

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

def set_settings()

  settings = YAML.load_file($settings_file)

  loop do
    puts "Settings:"
    puts "1.- Temperature unit: #{settings[:t_unit]}"
    puts "2.- Speed unit: #{settings[:s_unit]}"
    puts "3.- Distance unit: #{settings[:d_unit]}"
    puts "0.- Exit settings"
    puts "Select a setting to modify:"

    option = gets.chomp.to_i

    case option
      when 1
        puts "Set temperature unit: "
        settings[:t_unit] = gets.chomp.strip
      when 2
        puts "Set speed unit: "
        settings[:s_unit] = gets.chomp.strip
      when 3
        puts "Set distance unit: "
        settings[:d_unit] = gets.chomp.strip
      when 0
        break
      else
        puts "Select a valid option"
    end

    File.open($settings_file, 'w') do |file|
      file.write(settings.to_yaml)
    end

  end

end

def set_history(city)
    $history.push(city)
end

def get_history()
  if $history.empty?
        puts "Your search history is empty."
        return
  end
  puts "History:"
    $history.each do |city|
      print "'" + city + "'"
    end
  print "\n"
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
      set_history(city)

      if !city.empty?
        get_weather(city)
      end

    when 2
      city = set_city()
      set_history(city)

      if !city.empty?
        get_weekly_weather(city)
      end

    when 3
      set_settings()
    when 4
      get_history()
    when 5
      puts "Exiting the program. Goodbye!"
      exit
    else
      puts "Invalid option. Please try again."
  end
end

def settings()

  unless File.exist?($settings_file)
    puts "Settings file doesn't exists, creating..."

    default_settings = {
      t_unit: "F",
      s_unit: "m",
      d_unit: "m"
    }

    File.open($settings_file, 'w') do |file|
      file.write(default_settings.to_yaml)
    end

  else

    puts "Loading settings..."

  end

end

settings()

# Main loop to keep the program running
loop do
  menu()
end

  