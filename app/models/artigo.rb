class Artigo < ActiveRecord::Base
	belongs_to :usuario
	validates :titulo, presence: true, length: { minimum: 3, maximum: 50 }
	validates :descricao, presence: true, length: {minimum: 5, maximum: 300 }
	validates :usuario_id, presence: true
end