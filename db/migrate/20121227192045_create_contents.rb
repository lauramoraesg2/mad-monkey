class CreateContents < ActiveRecord::Migration
  def change
    create_table  :contents do |t|
      t.string   :title
      t.string   :description
      t.string   :video_url
      t.string   :main_image_file_name
      t.string   :main_image_content_type
      t.integer  :main_image_file_size
      t.datetime :main_image_updated_at
      t.string   :main_image_description
      t.string   :image2_file_name
      t.string   :image2_content_type
      t.integer  :image2_file_size
      t.datetime :image2_updated_at
      t.string   :image2_description
      t.string   :second_description

      t.timestamps
    end
  end
end