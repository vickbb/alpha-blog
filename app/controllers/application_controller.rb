class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  helper_method :usuario_atual, :logged_in?

  def usuario_atual
  	@usuario_atual  ||= Usuario.find(session[:usuario_id]) if session[:usuario_id]
  end

  def logged_in?
  	!!usuario_atual
  end

  def require_user
  	if ! logged_in?
  		flash[:danger] = "Você deve estar logado para relizar essa ação"
  		redirect_to root_path
  	end
  end

end
