class CreatePeople < ActiveRecord::Migration[5.2]
  def change
    create_table :people do |t|
      t.string :first_name
      t.string :last_name
      t.string :occupation
      t.date :birthdate
      t.date :death
      t.text :bio
      t.references :country, foreign_key: true

      t.timestamps
    end
  end
end
