class AddPageToPeople < ActiveRecord::Migration[5.2]
  def change
    add_reference :people, :page, foreign_key: true
  end
end
