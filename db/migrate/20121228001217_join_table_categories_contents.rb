class JoinTableCategoriesContents < ActiveRecord::Migration
  def up
    create_table :categories_contents, :id => false do |t|
      t.integer :categories_id
      t.integer :contents_id
    end
  end

  def down
    drop_table :categories_contents
  end
end