class ArtigosController < ApplicationController
	
	before_action :set_artigo, only: [:edit, :update, :show, :destroy]

	def index
		@artigos = Artigo.all
	end

	def new
		@artigo = Artigo.new
	end

	def edit
	end

	def create
		@artigo = Artigo.new(artigo_params)
		@artigo.usuario = User.first
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
end