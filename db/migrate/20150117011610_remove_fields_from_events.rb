class RemoveFieldsFromEvents < ActiveRecord::Migration
  def change
    remove_column :events, :tag_name, :string
    remove_column :events, :action, :string
    remove_column :events, :referrer, :string
  end
end
