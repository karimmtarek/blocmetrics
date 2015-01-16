class ChangeTypeToTagName < ActiveRecord::Migration
  def change
    rename_column :events, :type, :tag_name
  end
end
