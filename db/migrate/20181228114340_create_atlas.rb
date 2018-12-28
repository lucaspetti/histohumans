class CreateAtlas < ActiveRecord::Migration[5.2]
  def change
    create_table :atlas do |t|
      t.integer :year
      t.string :photo
      t.references :country, foreign_key: true

      t.timestamps
    end
  end
end
