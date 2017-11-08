class UsuariosController < ApplicationController

	before_action :set_usuario, only: [:edit, :update, :show]
	before_action :require_same_user, only: [:edit, :update, :destroy]
  before_action :require_admin, only: [:destroy]

	def index
		@usuarios = Usuario.paginate(page: params[:page], per_page: 5)
	end

	def new
		@usuario = Usuario.new
	end

	def create
		@usuario = Usuario.new(usuario_params)

		if @usuario.save
			session[:usuario_id] = @usuario.id
			flash[:sucess] = "Bem vindo ao AlphaBlog #{@usuario.username}"
			redirect_to usuario_path(@usuario)
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

  def destroy
    @usuario = Usuario.find(params[:id])
    @usuario.destroy
    flash[:danger] = "O usuario e todos seus artigos foram deletados"
    redirect_to usuarios_path
  end

	private
	def usuario_params
		params.require(:usuario).permit(:username, :email, :password)
	end

	def set_usuario
		@usuario = Usuario.find(params[:id])
	end

	def require_same_user
		if usuario_atual != @usuario and !usuario_atual.admin?
			flash[:danger] = "Você so pode editar sua conta"
			redirect_to root_path
		end
	end

  def require_admin
    if logged_in? and !usuario_atual.admin?
      flash[:danger] = "Somente administradores podem realizar essa ação"
      redirect_to root_path
    end
  end

end