require 'date'

puts "Ingresa tu nombre:"
nombre = gets.chomp
puts "Ingresa un mensaje:"
mensaje = gets.chomp

fecha = DateTime.now

puts "Este es tu mensaje personalizado:"

puts "#{mensaje} \n#{nombre} - #{fecha}"