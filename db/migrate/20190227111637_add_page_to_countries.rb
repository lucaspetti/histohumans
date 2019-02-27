class AddPageToCountries < ActiveRecord::Migration[5.2]
  def change
    add_reference :countries, :page, foreign_key: true
  end
end
