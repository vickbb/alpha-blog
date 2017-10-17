class UsuariosController < ApplicationController
	def new
		@usuario = Usuario.new
	end

	def create
		@usuario = Usuario.new(usuario_params)

		if @usuario.save
			flash[:sucess] = "Bem vindo ao AlphaBlog #{@usuario.username}"
			redirect_to artigos_path
		else
			render 'new'
		end
	end


	private
	def usuario_params
		params.require(:usuario).permit(:username, :email, :password)
	end
end