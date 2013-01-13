class Topic < ActiveRecord::Base
  # attr_accessible :title, :body

  #TODO TEM Q TER PELO MENOS UMA DESCRIÇÃO

  has_many :categories

  validates_presence_of :title

  #validates_each :main_image do |record, attr, main_image_description|
  #  record.errors.add(attr, I18n.t('activerecord.attributes.topic.error_empty_image')) if (main_image_description.present? and record.main_image_description.present?)
  #end
  #
  ##TODO SE TIVER DESCRICAO DA IMAGEM, TEM Q TER a imagem (ambas)  -  n tah funcionando
  #validates_presence_of :main_image, :if => Proc.new { |topic| topic.main_image_description.present? }

  validates_presence_of :description, :if => Proc.new { |topic| topic.main_image_description.present? }

  has_attached_file :main_image,
                    :styles => {:thumb => "100x100>", :medium => "212x149#"},
                    :url => "/assets/topic/:id/images/main_:style.:extension",
                    :path => ":rails_root/public/assets/topic/:id/images/main_:style.:extension"

  has_attached_file :image2,
                    :styles => {:thumb => "100x100>"},
                    :url => "/assets/topic/:id/images/image2_:style.:extension",
                    :path => ":rails_root/public/assets/topic/:id/images/image2_:style.:extension"

end