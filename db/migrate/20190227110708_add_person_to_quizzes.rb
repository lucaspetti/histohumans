class AddPersonToQuizzes < ActiveRecord::Migration[5.2]
  def change
    add_reference :quizzes, :person, foreign_key: true
  end
end
