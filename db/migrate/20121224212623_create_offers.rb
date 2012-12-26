class CreateOffers < ActiveRecord::Migration
  def change
    create_table  :offers do |t|
      t.string   :name
      t.string   :description
      t.integer  :code
      t.boolean  :active
      t.decimal  :original_price
      t.decimal  :discount_price
      t.string   :technical_information
      t.integer  :quantity_in_stock
      t.string   :main_image_file_name
      t.string   :main_image_content_type
      t.integer  :main_image_file_size
      t.datetime :main_image_updated_at

      t.timestamps
    end
  end
end