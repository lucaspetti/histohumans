# Add countries from json file
countries = JSON.parse(File.read("db/countries.json"))
# puts countries
array = countries.each do |country|
  Country.create!(country) unless Country.find_by(name: country["name"])
end
puts array
# Add people
