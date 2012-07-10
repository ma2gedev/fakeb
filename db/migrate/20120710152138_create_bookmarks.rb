class CreateBookmarks < ActiveRecord::Migration
  def change
    create_table :bookmarks do |t|
      t.references :user, index: true
      t.references :entry, index: true
      t.text :comment

      t.timestamps
    end
  end
end
