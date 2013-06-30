class ApplicationController < ActionController::Base
  protect_from_forgery

  before_filter :autenticar_usuarios, :except => :login

  protected
  def autenticar_usuarios
	  authenticate_or_request_with_http_basic do |username, password|
      not Usuario.get_persona_by_username_password(username, password).nil?
	  end
  end

  #rescue_from Exception, :with => :handle_exceptions

	private

=begin
  def handle_exceptions(e)
    case e
    when CanCan::AccessDenied
      authenticate_user!
    when ActiveRecord::RecordNotFound
      not_found
    else
      internal_error(e)
    end
  end

  def not_found
    # Just render view
    render 'application/not_found', :status => 404
  end

  def internal_error(exception)
    if false #RAILS_ENV == 'production'
      # Send message to admin email via exception_notification
      request.env['exception_notifier.options'] = {
        :sender_address       => "sender@example.com",
        :exception_recipients => "recipient@example.com"
      }

      ExceptionNotifier::Notifier.exception_notification(request.env, exception).deliver

      # And just render view
      render :layout   => 'layouts/internal_error',
              :template => 'application/internal_error',
              :status   => 500
    else
      throw exception
    end
  end
=end
end
