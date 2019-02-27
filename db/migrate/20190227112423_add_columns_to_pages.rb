class AddColumnsToPages < ActiveRecord::Migration[5.2]
  def change
    add_reference :pages, :person, foreign_key: true
    add_reference :pages, :country, foreign_key: true
  end
end
