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

array = countries.each { |country| Country.create!(country) unless Country.find_by(name: country["name"]) }
countries.each do |country|
  c = Country.find_by(name: country["name"])
  # puts "#{c.name} is in #{country['continent']} actual continent_id is #{c.continent_id}"
  if country["continent"]
    c.continent_id = Continent.find_by(name: country["continent"]).id
    # puts "#{c.continent_id}"
    c.save!
  end
end

puts "Countries added. Adding people..."

people = JSON.parse(File.read("db/people.json"))

people.each do |person|
  person["country"] = Country.find_by(name: person["country"])
  pe = Person.create!(person) unless Person.find_by(photo: person["photo"])
end

puts 'Done!'
