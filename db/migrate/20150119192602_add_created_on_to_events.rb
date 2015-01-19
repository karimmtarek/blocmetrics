class AddCreatedOnToEvents < ActiveRecord::Migration
  def change
    add_column :events, :created_on, :date
  end
end
