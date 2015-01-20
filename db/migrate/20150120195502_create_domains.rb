class CreateDomains < ActiveRecord::Migration
  def change
    create_table :domains do |t|
      t.string :url
      t.references :user, index: true

      t.timestamps null: false
    end
    add_foreign_key :domains, :users
  end
end
