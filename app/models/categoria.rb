class Categoria < ActiveRecord::Base
  # self.table_name = 'categorias'

  validates :nome, presence: true, length: { minimum: 3, maximum: 25 }
  validates_uniqueness_of :nome
end