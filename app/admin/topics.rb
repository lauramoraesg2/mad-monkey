ActiveAdmin.register Topic do

  #TODO COLOKR PRA APARECER VIDEO DIRETO NA PAGINA, COMO NO UTUB

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
        image_tag(topic.main_image.url(:thumb))
      end
      row :main_image_description
      row :image2 do
        image_tag(topic.image2.url(:thumb))
      end
      row :image2_description
      row :second_description
      row :created_at
      row :updated_at
    end
  end

  form do |f|
    f.inputs I18n.t("activerecord.models.topic"), :multipart => true do
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