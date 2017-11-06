class SessionsController < ApplicationController
	
	def new

	end

	def create
		usuario = Usuario.find_by(email: params[:session][:email].downcase)
		
		if usuario && usuario.authenticate(params[:session][:password])
			session[:usuario_id] = usuario.id
			flash[:success] = "Logando!"
			redirect_to usuario_path(usuario)
		else
			flash.now[:danger] = "Email ou senha invalidos"
			render 'new'
		end
	end

	def destroy
		session[:usuario_id] = nil
		flash[:success] = "Você deslogou!"
		redirect_to root_path
	end

end