class Offer < ActiveRecord::Base
  # attr_accessible :title, :body

  has_many :categories

  #TODO: COLOCAR ATIVO COMO PADRÃO - SEMPRE Q CADASTRAR UMA NOVA OFERTA, ELA ESTÁ ATIVA,
  #PARA DESATIVÁ-LA,É NECESSÁRIO ENTRAR NELA DE NOVO OU COLOCAR NAS AÇÕES DO LADO,
  #DE TODA FORMA,NÃO MOSTRAR CAMPO DE DESATIVAR NA HRA DE CADASTRAR UMA OFERTA
  #TEM ISSO DE DESATIVAR NAS AÇÕES NO NETSABE ECOMMERCE

  #TODO: ACHO QUE A QUANTIDADE EM ESTOQUE NÃO PODE SER 0 (zero)
  #TODO: PREÇO DE DESCONTO NÃO PODE SER MAIOR QUE PREÇO NORMAL
  #TODO: MUDAR DECIMAIS (COLOKR CASAS DPS DA VIRGULA, ETC)
  #TODO: TEM Q TER PELO MENOS 2 TAMANHOS DE IAMGENS (1 PRA MINIATURAS E OUTRA PRO DETALHE DA OFERTA)

  validates_presence_of :name, :description, :code, :discount_price, :quantity_in_stock
  validates_attachment_presence :main_image

  validates_numericality_of :code, :original_price, :discount_price, :quantity_in_stock

  has_attached_file :main_image,
                    :styles => {:thumb => "100x100>"},
                    :url => "/assets/offer/:id/images/main_:style.:extension",
                    :path => ":rails_root/public/assets/offer/:id/images/main_:style.:extension"
end