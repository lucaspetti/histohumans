puts "Adding countries..."
countries = JSON.parse(File.read("db/countries.json"))

array = countries.each { |country| Country.create!(country) unless Country.find_by(name: country["name"]) }

puts "Countries added. Adding people..."

people = JSON.parse(File.read("db/people.json"))

people.each do |person|
  person["country"] = Country.find_by(name: person["country"])
  pe = Person.create!(person) unless Person.find_by(photo: person["photo"])
end

puts 'Done!'
