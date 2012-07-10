class CreateEntries < ActiveRecord::Migration
  def change
    create_table :entries do |t|
      t.text :url, :null => false
      t.text :title

      t.timestamps
    end
  end
end
