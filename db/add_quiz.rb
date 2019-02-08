require 'json'
require 'date'

puts 'Quiz name:'
quiz_name = gets.chomp

puts 'Quiz level:'
level = gets.chomp

puts 'Country: (leave blank if there is no country)'
country = gets.chomp

puts 'First question'
first_content = gets.chomp

puts 'Question score:'
first_score = gets.chomp

puts 'Option 1: (the correct one)'
first_option_1 = gets.chomp

puts 'Option 2:'
first_option_2 = gets.chomp

puts 'Option 3:'
first_option_3 = gets.chomp

puts 'Option 4:'
first_option_4 = gets.chomp

puts 'Second question'
second_content = gets.chomp

puts 'Question score:'
second_score = gets.chomp

puts 'Option 1: (the correct one)'
second_option_1 = gets.chomp

puts 'Option 2:'
second_option_2 = gets.chomp

puts 'Option 3:'
second_option_3 = gets.chomp

puts 'Option 4:'
second_option_4 = gets.chomp

quiz_hash = {
  name: quiz_name,
  level: level,
  country: country,
  questions:
    [{
      content: first_content,
      score: first_score,
      options: {
        "#{first_option_1}": true,
        "#{first_option_2}": false,
        "#{first_option_3}": false,
        "#{first_option_4}": false,
      }
    },
      {
        content: second_content,
        score: second_score,
        options: {
          "#{second_option_1}": true,
          "#{second_option_2}": false,
          "#{second_option_3}": false,
          "#{second_option_4}": false,
        }
      }]
}

# person_hash = { first_name: first_name,
#                 last_name: last_name,
#                 occupation: occupation,
#                 photo: img_url,
#                 birthdate: Date.parse(birthdate),
#                 death: death,
#                 country: country_name,
#                 bio: bio
#                }

json = File.read("db/quizzes.json")
json_array = JSON.parse(json)
json_array << quiz_hash

File.open("db/quizzes.json", "w") do |f|
  f.puts JSON.pretty_generate(json_array)
end

