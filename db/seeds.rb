# puts "Adding Continents..."

# Continent.create!(name: 'North America')
# Continent.create!(name: 'South America')
# Continent.create!(name: 'Africa')
# Continent.create!(name: 'Asia')
# Continent.create!(name: 'Europe')
# Continent.create!(name: 'Oceania')
# Continent.create!(name: 'Antarctica')

puts "Adding countries..."
countries = JSON.parse(File.read("db/countries.json"))

array = countries.each do |country|
  unless Country.find_by(name: country["name"])
    country["continent"] = Continent.find_by(name: country["continent"]) if country["continent"]
    c = Country.create!(country)
  end
end

puts "Countries added. Adding people..."

people = JSON.parse(File.read("db/people.json"))

people.each do |person|
  person["country"] = Country.find_by(name: person["country"])
  pe = Person.create!(person) unless Person.find_by(photo: person["photo"])
end

puts 'Done!'
