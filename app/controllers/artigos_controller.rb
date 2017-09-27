class ArtigosController < ApplicationController
	def new
		@artigo = Artigo.new
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

	def show
		@artigo = Artigo.find(params[:id])
	end

	private
	def artigo_params
		params.require(:artigo).permit(:titulo, :descricao)
	end
end