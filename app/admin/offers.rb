ActiveAdmin.register Offer do

  #TODO: ACHO QUE A QUANTIDADE EM ESTOQUE NÃO PODE SER 0
  #TODO: PREÇO DE DESCONTO NÃO PODE SER MAIOR QUE PREÇO NORMAL
  #TODO: MUDAR DECIMAIS (COLOKR CASAS DPS DA VIRGULA, ETC)

  filter :name
  filter :code
  #TODO FAZER FILTRO POR PREÇO? COM INTERVALO DE PREÇO

  index do
    column :id
    column :name
    column :active
    default_actions
  end

  show do
    attributes_table do
      row :id
      row :name
      row :description
      row :code
      row :active
      row :original_price
      row :discount_price
      row :technical_information
      row :quantity_in_stock
      row :main_image do
        image_tag(offer.main_image.url(:icon))
      end
      row :created_at
      row :updated_at
    end
  end

  form do |f|
    f.inputs I18n.t("activerecord.models.offer"), :multipart => true do
      f.input :name
      f.input :description, :as => :text, :input_html => {:rows => 4}
      f.input :code
      f.input :active
      f.input :original_price
      f.input :discount_price
      f.input :technical_information, :as => :text, :input_html => {:rows => 4}
      f.input :quantity_in_stock
      f.input :main_image
    end
    f.actions
  end
  
end