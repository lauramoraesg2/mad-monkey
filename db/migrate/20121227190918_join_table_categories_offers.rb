class JoinTableCategoriesOffers < ActiveRecord::Migration
  def up
    create_table :categories_offers, :id => false do |t|
      t.integer :categories_id
      t.integer :offers_id
    end
  end

  def down
    drop_table :categories_offers
  end
end