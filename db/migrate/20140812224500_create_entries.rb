class CreateEntries < ActiveRecord::Migration
  def change
    create_table :entries do |t|
      t.text :journal_entry
      t.timestamps
    end
    add_reference :entries, :location, index: true
  end
end
