class Content < ActiveRecord::Base
  # attr_accessible :title, :body

  #TODO SE TIVER DESCRICAO DA IMAGEM, TEM Q TER a imagem (ambas)
  #TODO TEM Q TER PELO MENOS UMA DESCRIÇÃO

  has_many :categories

  validates_presence_of :title

  has_attached_file :main_image,
                    :styles => {:thumb => "100x100>"},
                    :url => "/assets/content/:id/images/main_:style.:extension",
                    :path => ":rails_root/public/assets/content/:id/images/main_:style.:extension"

  has_attached_file :image2,
                    :styles => {:thumb => "100x100>"},
                    :url => "/assets/content/:id/images/image2_:style.:extension",
                    :path => ":rails_root/public/assets/content/:id/images/image2_:style.:extension"
end