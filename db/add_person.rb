# require 'json'
# require 'fastimage'

puts 'First name:'
first_name = gets.chomp

puts 'Last name:'
last_name = gets.chomp

puts 'Occupation:'
occupation = gets.chomp

puts 'Image URL:'
img_url = gets.chomp

puts 'Birthdate:'
birthdate = gets.chomp
# Date needs to be passed as 1789-07-10
puts 'Death:'
death = gets.chomp

person_hash = { first_name: first_name,
                last_name: last_name,
                occupation: occupation,
                photo: img_url,
                birthdate: Date.parse(birthdate),
                death: Date.parse(death)
               }

json = File.read("people.json")
json_array = JSON.parse(json)
json_array << person_hash

File.open("people.json", "w") do |f|
  f.puts JSON.pretty_generate(json_array)
end
