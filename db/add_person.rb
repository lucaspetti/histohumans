require 'json'
require 'date'
require 'wikipedia'

puts 'First name:'
first_name = gets.chomp

puts 'Last name:'
last_name = gets.chomp

page = Wikipedia.find("#{first_name}_#{last_name}") || ""

puts 'Country:'
country_name = gets.chomp

puts 'Occupation:'
occupation = gets.chomp

if page.content
  puts "Found on Wikipedia"
  dates = page.content[/(\W(\d{4})\W(\d{1,2})\W(\d{1,2})){2}/] || ""
  dates = dates.split('|')
end

puts 'Image URL:'
img_url = page.main_image_url || gets.chomp

birthdate = "#{dates[4]}-#{dates[5]}-#{dates[6]}"
death = "#{dates[1]}-#{dates[2]}-#{dates[3]}"

if dates.empty?
  puts 'Birthdate (pass as 1789-07-10):'
  birthdate = gets.chomp

  puts 'Death: (Leave blank if person is alive)'
  death = gets.chomp
end

death = Date.parse(death) unless death.empty?

puts 'Give a short bio (can be edited later):'
bio = page.summary || gets.chomp

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
