class CreateProperties < ActiveRecord::Migration
  def change
    create_table :properties do |t|
      t.string :key
      t.string :value
      t.references :event, index: true

      t.timestamps null: false
    end
    add_foreign_key :properties, :events
  end
end
