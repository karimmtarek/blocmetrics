class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string :name
      t.string :type
      t.string :action
      t.string :referrer

      t.timestamps null: false
    end
  end
end
