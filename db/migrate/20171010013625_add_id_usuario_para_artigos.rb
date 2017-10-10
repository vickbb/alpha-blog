class AddIdUsuarioParaArtigos < ActiveRecord::Migration[5.1]
  def change
  	add_column :artigos, :usuario_id, :integer
  end
end
