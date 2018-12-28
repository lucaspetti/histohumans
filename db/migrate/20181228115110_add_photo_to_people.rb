class AddPhotoToPeople < ActiveRecord::Migration[5.2]
  def change
    add_column :people, :photo, :string
  end
end
