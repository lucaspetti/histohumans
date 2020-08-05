class AddImageAndBioToPeople < ActiveRecord::Migration[6.0]
  def change
    add_column :people, :image_url, :string
    add_column :people, :bio, :text
  end
end
