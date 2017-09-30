class ArtigosController < ApplicationController
	
	def index
		@artigos = Artigo.all
	end

	def new
		@artigo = Artigo.new
	end

	def edit
		@artigo = Artigo.find(params[:id])
	end

	def create
		@artigo = Artigo.new(artigo_params)
		if @artigo.save
			flash[:notice] = "Artigo foi criado com sucesso!"
			redirect_to artigo_path(@artigo)
		else
			render :new
		end
	end

	def update
		@artigo = Artigo.find(params[:id])
		if @artigo.update(artigo_params)
			flash[:notice] = "Artigo foi editado com sucesso!"
			redirect_to artigo_path(@artigo)
		else
			render :edit
		end
	end

	def show
		@artigo = Artigo.find(params[:id])
	end

	def destroy
		@artigo = Artigo.find(params[:id])
		@artigo.destroy
		flash[:notice] = "Artigo foi removido com sucesso!"
		redirect_to artigos_path
	end

	private
	def artigo_params
		params.require(:artigo).permit(:titulo, :descricao)
	end
end