puts "Adding Continents..."

['North America', 'South America', 'Africa', 'Asia', 'Europe', 'Oceania', 'Antarctica'].each do |c|
  Continent.create!(name: c) unless Continent.find_by(name: c)
end

puts "Adding countries..."
countries = JSON.parse(File.read("db/countries.json"))

array = countries.each do |country|
  unless Country.find_by(name: country["name"])
    if country["continent"]
      country["continent"] = Continent.find_by(name: country["continent"])
      c = Country.new(country)
      c.flag = "https://www.countryflags.io/#{c.code}/flat/64.png"
      c.save!
    end
  end
end

puts "Countries added. Adding people..."

people = JSON.parse(File.read("db/people.json"))

people.each do |person|
  person["country"] = Country.find_by(name: person["country"])
  pe = Person.create!(person) unless Person.find_by(photo: person["photo"])
end

puts 'Done!'
