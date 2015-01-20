class AddSourceUrlToEvents < ActiveRecord::Migration
  def change
    add_column :events, :source_url, :string
  end
end
