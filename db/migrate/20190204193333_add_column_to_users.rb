class AddColumnToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :first_name, :string
    add_column :users, :last_name, :string
    add_column :users, :level, :string
    add_column :users, :score, :integer
    add_reference :users, :quiz, foreign_key: true
  end
end
