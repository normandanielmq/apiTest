class ApplicationController < ActionController::Base
  protect_from_forgery

  before_filter :autenticar_usuarios, :except => :login

  protected
  def autenticar_usuarios
	  authenticate_or_request_with_http_basic do |username, password|
      	not Usuario.get_persona_by_username_password(username, password).nil?
	  end
  end
end
