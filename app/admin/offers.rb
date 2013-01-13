ActiveAdmin.register Offer do

  filter :name
  filter :code

  index do
    column :code
    column :name
    column :active
    default_actions
  end

  show do
    attributes_table do
      row :code
      row :active
      row :name
      row :description
      row :technical_information
      row :original_price
      row :discount_price
      row :quantity_in_stock
      row :main_image do
        image_tag(offer.main_image.url(:thumb))
      end
      row :created_at
      row :updated_at
    end
  end

  form do |f|
    f.inputs I18n.t("activerecord.models.offer"), :multipart => true do
      f.input :code
      f.input :name
      f.input :description, :as => :text, :input_html => {:rows => 4}
      f.input :technical_information, :as => :text, :input_html => {:rows => 4}
      f.input :original_price
      f.input :discount_price
      f.input :quantity_in_stock
      f.input :main_image
    end

    #TODO COLOCAR A QUAIS CATEGORIAS A OFERTA ESTÁ RELACIONADA
    #f.inputs I18n.t("activerecord.attributes.offer.related_categories"), :multipart => true do
    #    f.input :categories, :as => :check_boxes, :collection => Category.all
    #end

    f.actions
  end
  
end