ActiveAdmin.register Content do

  #TODO FILTRAR PRO PARTE DO TITULO (VER SE FUNCIONA É ASSIM OU SE TEM Q MUDAR ALGO)
  #TODO VER SE TEM COMO APARECER VIDEO DIREITO NA PAGINA, COMO NO UTUB
  #TODO TRADUCAO N ESTÁ PEGANDO

  filter :title

  index do
    column :id
    column :title
    default_actions
  end

  show do
    attributes_table do
      row :id
      row :title
      row :description
      row :video_url
      row :main_image do
        image_tag(content.main_image.url(:thumb))
      end
      row :main_image_description
      row :image2 do
        image_tag(content.image2.url(:thumb))
      end
      row :image2_description
      row :second_description
      row :created_at
      row :updated_at
    end
  end

  form do |f|
    f.inputs I18n.t("activerecord.models.content"), :multipart => true do
      f.input :title
      f.input :description, :as => :text, :input_html => {:rows => 4}
      f.input :video_url
      f.input :main_image
      f.input :main_image_description
      f.input :image2
      f.input :image2_description
      f.input :second_description, :as => :text, :input_html => {:rows => 4}
    end
    f.actions
  end

end