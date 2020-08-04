class CreatePeople < ActiveRecord::Migration[6.0]
  def change
    create_table :people do |t|
      t.string :name
      t.string :country
      t.string :country_code
      t.datetime :birthdate
      t.datetime :death
      t.string :occupation

      t.timestamps
    end
  end
end
