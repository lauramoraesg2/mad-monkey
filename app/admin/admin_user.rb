ActiveAdmin.register AdminUser do

  filter :email

  index do
    column :id
    column :email
    default_actions
  end

  show do
    attributes_table do
      row :id
      row :email
      row :created_at
      row :updated_at
    end
  end

  form do |f|
    f.inputs "Admin Details" do
      if f.object.new_record?
        f.input :email
        f.input :password
        f.input :password_confirmation
      else
        f.input :email
      end
    end
    f.actions
  end

end