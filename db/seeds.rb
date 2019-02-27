puts "Adding Continents..."

['North America', 'South America', 'Africa', 'Asia', 'Europe', 'Oceania', 'Antarctica'].each do |c|
  Continent.create!(name: c) unless Continent.find_by(name: c)
end

puts "Adding countries..."
# countries = JSON.parse(File.read("db/countries.json"))

# array = countries.each do |country|
#   if Country.find_by(name: country["name"])
#     c = Country.find_by(name: country["name"])
#     c.remote_photo_url = country["photo"] if c.photo.filename == 'https://images.pexels.com/photos/356993/pexels-photo-356993.jpeg_auto_compress_cs_tinysrgb_dpr_2_h_650_w_940' || c.photo == nil
#     c.save!
#   else
#     if country["continent"]
#       country["continent"] = Continent.find_by(name: country["continent"])
#       c = Country.new(country)
#       c.flag = "https://www.countryflags.io/#{c.code}/flat/64.png"
#       c.remote_photo_url = country["photo"]
#       c.save!
#     end
#   end
# end

puts "Countries added. Adding people..."

people = JSON.parse(File.read("db/people.json"))

people.each do |person|
  person["country"] = Country.find_by(name: person["country"])
  new_person = Person.create!(person) unless Person.find_by(photo: person["photo"])
  page = Wikipedia.find(new_person.full_name)
  # Page.create!(person: new_person, url: page.fullurl, content: page.content)
end

puts "Adding quizzes..."

quizzes = JSON.parse(File.read("db/quizzes.json"))

# Quiz.destroy_all

quizzes.each do |quiz|
  unless Quiz.find_by(name: quiz["name"])
    q = Quiz.new(name: quiz["name"], level: quiz["level"], done: false)
    q.country = Country.find_by(name: quiz["country"]) unless quiz["country"].empty?
    quiz["questions"].each do |question|
      quest = Question.new(quiz: q, content: question["content"], score: question["score"])

      question["options"].each do |text, correct|
        opt = Option.create!(question: quest, text: text, correct: correct)
      end
      quest.save!
    end
    q.save!
  end
end

puts 'Done!'
