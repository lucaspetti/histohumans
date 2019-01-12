require 'json'
require 'date'

puts 'First name:'
first_name = gets.chomp

puts 'Last name:'
last_name = gets.chomp

puts 'Country:'
country_name = gets.chomp

puts 'Occupation:'
occupation = gets.chomp

puts 'Image URL:'
img_url = gets.chomp

puts 'Birthdate (pass as 1789-07-10):'
birthdate = gets.chomp
# Date needs to be passed as 1789-07-10
puts 'Death: (Leave blank if person is alive)'
death = gets.chomp
death = Date.parse(death) unless death.empty?

puts 'Give a short bio (can be edited later):'
bio = gets.chomp

person_hash = { first_name: first_name,
                last_name: last_name,
                occupation: occupation,
                photo: img_url,
                birthdate: Date.parse(birthdate),
                death: death,
                country: country_name,
                bio: bio
               }

json = File.read("db/people.json")
json_array = JSON.parse(json)
json_array << person_hash

File.open("db/people.json", "w") do |f|
  f.puts JSON.pretty_generate(json_array)
end
