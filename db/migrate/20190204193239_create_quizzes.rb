class CreateQuizzes < ActiveRecord::Migration[5.2]
  def change
    create_table :quizzes do |t|
      t.string :name
      t.string :level
      t.boolean :done
      t.references :country, foreign_key: true

      t.timestamps
    end
  end
end
