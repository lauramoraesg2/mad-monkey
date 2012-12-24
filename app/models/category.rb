class Category < ActiveRecord::Base
  # attr_accessible :title, :body

  validates_presence_of :name
  validates_attachment_presence :main_image

  has_attached_file :main_image,
                    :styles => {:thumb => "16x16>"},
                    :url => "/assets/categories/:id/images/main_:style.:extension",
                    :path => ":rails_root/public/assets/categories/:id/images/main_:style.:extension"
end