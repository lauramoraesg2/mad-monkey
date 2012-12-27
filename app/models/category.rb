class Category < ActiveRecord::Base
  # attr_accessible :title, :body

  has_many :offers

  validates_presence_of :name
  validates_attachment_presence :main_image

  has_attached_file :main_image,
                    :styles => {:icon => "16x16>"},
                    :url => "/assets/category/:id/images/main_:style.:extension",
                    :path => ":rails_root/public/assets/category/:id/images/main_:style.:extension"
end