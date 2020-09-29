# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#

puts 'Gathering data...'

data = File.read(Rails.root.join('db', 'data', 'people.json'))
people = JSON.parse(data)

puts 'Seeding database...'

people.each { |params| Person.create!(params) }

puts 'Fetching data from Wikipedia...'

Syncer::People.new(Person.all).call

puts 'Done'
