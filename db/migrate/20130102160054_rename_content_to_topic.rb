class RenameContentToTopic < ActiveRecord::Migration
  def up
    rename_table :contents, :topics
  end

  def down
    rename_table :topics, :contents
  end
end