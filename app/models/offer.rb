class Offer < ActiveRecord::Base
  # attr_accessible :title, :body

  has_many :categories

  #TODO: COLOCAR ATIVO COMO PADRÃO - SEMPRE Q CADASTRAR UMA NOVA OFERTA, ELA ESTÁ ATIVA,
  #PARA DESATIVÁ-LA,COLOCAR NAS AÇÕES DO LADO (NETSABE ECOMMERCE)
  #TODO: ACHO QUE A QUANTIDADE EM ESTOQUE NÃO PODE SER 0 (zero)
  #TODO: MUDAR DECIMAIS (COLOKR CASAS DPS DA VIRGULA, ETC)
  #TODO VERIFICAR VALIDAÇÕES DE PREÇO - 1º PREÇO PODE FICAR EM BRANCO,
  #MAS QNDO PREENCHIDO DEVE SER UM NÚMERO

  validates_presence_of :name, :description, :code, :discount_price, :quantity_in_stock
  validates_attachment_presence :main_image

  validates_numericality_of :code, :discount_price, :quantity_in_stock
  validates_uniqueness_of :code

  validates_each :discount_price do |record, attr, original_price|
    record.errors.add(attr, I18n.t('activerecord.attributes.offer.error_discount')) if (original_price.present? and record.original_price.present? and original_price.to_f > record.original_price.to_f)
  end

  has_attached_file :main_image,
                    :styles => {:large => "274x193#", :medium => "212x149#", :thumb => "100x100>"},
                    :url => "/assets/offer/:id/images/main_:style.:extension",
                    :path => ":rails_root/public/assets/offer/:id/images/main_:style.:extension"
end