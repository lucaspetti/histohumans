class RemoveContinentFromCountries < ActiveRecord::Migration[5.2]
  def change
    remove_column :countries, :continent, :string
  end
end
