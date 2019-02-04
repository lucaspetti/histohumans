class CreateQuestions < ActiveRecord::Migration[5.2]
  def change
    create_table :questions do |t|
      t.references :quiz, foreign_key: true
      t.integer :score

      t.timestamps
    end
  end
end
