class CreateCategories < ActiveRecord::Migration
  def change

    drop_table :categories

    create_table :categories do |t|
      t.string :name
      t.string :description
      t.string :main_image_file_name
      t.string :main_image_content_type
      t.integer :main_image_file_size
      t.datetime :main_image_updated_at

      t.timestamps
    end
  end
end
