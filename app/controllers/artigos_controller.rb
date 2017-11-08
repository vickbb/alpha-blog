class ArtigosController < ApplicationController

	before_action :set_artigo, only: [:edit, :update, :show, :destroy]
	before_action :require_user, except: [:index, :show]
	before_action :require_same_user, only: [:edit, :update, :destroy]

	def index
		@artigos = Artigo.paginate(page: params[:page], per_page: 5)
	end

	def new
		@artigo = Artigo.new
	end

	def edit
	end

	def create
		@artigo = Artigo.new(artigo_params)
		@artigo.usuario = usuario_atual
		if @artigo.save
			flash[:success] = "Artigo foi criado com sucesso!"
			redirect_to artigo_path(@artigo)
		else
			render :new
		end
	end

	def update
		if @artigo.update(artigo_params)
			flash[:success] = "Artigo foi editado com sucesso!"
			redirect_to artigo_path(@artigo)
		else
			render :edit
		end
	end

	def show
	end

	def destroy
		@artigo.destroy
		flash[:danger] = "Artigo foi removido com sucesso!"
		redirect_to artigos_path
	end

	private
	def set_artigo
		@artigo = Artigo.find(params[:id])
	end

	def artigo_params
		params.require(:artigo).permit(:titulo, :descricao)
	end

	def require_same_user
		if usuario_atual != @artigo.usuario and !usuario_atual.admin?5
			flash[:danger] = "Você só pode modificar ou editar seus artigos!"
			redirect_to root_path
		end
	end
end