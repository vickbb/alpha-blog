class Artigo < ActiveRecord::Base
	validates :titulo, presence: true, length: { minimum: 3, maximum: 50 }
	validates :descricao, presence: true, length: {minimum: 5, maximum: 300 }
end