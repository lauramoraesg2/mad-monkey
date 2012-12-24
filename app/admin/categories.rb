ActiveAdmin.register Category do

  filter :name

  index do
    column :id
    column :name
    default_actions
  end

  show do
    attributes_table do
      row :id
      row :name
      row :description
      row :main_image do
        image_tag(category.main_image.url(:icon))
      end
      row :created_at
      row :updated_at
    end
  end

  form do |f|
    f.inputs I18n.t("activerecord.models.category"), :multipart => true do
        f.input :name
        f.input :description, :as => :text, :input_html => {:rows => 4}
        f.input :main_image
      end
    f.actions
  end

end