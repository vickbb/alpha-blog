class UsuariosController < ApplicationController
	
	before_action :set_usuario, only: [:edit, :update, :show]
	before_action :require_same_user, only: [:edit, :update]

	def index
		@usuarios = Usuario.paginate(page: params[:page], per_page: 5)
	end

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

	def edit
	end

	def update
		if @usuario.update(usuario_params)
			flash[:sucess] = "Sua conta foi atualizada"
			redirect_to artigos_path
		else
			render 'edit'
		end
	end

	def show
		@usuario_artigos = @usuario.artigos.paginate(page: params[:page], per_page: 5)
	end

	private
	def usuario_params
		params.require(:usuario).permit(:username, :email, :password)
	end

	def set_usuario
		@usuario = Usuario.find(params[:id])
	end
	
	def require_same_user
		if usuario_atual != @usuario
			flash[:danger] = "Você so pode editar sua conta"
			redirect_to root_path
		end
	end
end