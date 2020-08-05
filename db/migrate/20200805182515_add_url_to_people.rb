class AddUrlToPeople < ActiveRecord::Migration[6.0]
  def change
    add_column :people, :url, :string
  end
end
