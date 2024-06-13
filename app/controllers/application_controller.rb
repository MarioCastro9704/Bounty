class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  before_action :configure_permitted_parameters, if: :devise_controller?

  def configure_permitted_parameters
    # For additional fields in app/views/devise/registrations/new.html.erb
    devise_parameter_sanitizer.permit(:sign_up, keys: %i[first_name last_name])

    # For additional in app/views/devise/registrations/edit.html.erb
    devise_parameter_sanitizer.permit(:account_update, keys: %i[first_name last_name])
  end

  helper_method :current_cart

  def current_cart
    if session[:cart_id]
      @current_cart = Cart.find_by(id: session[:cart_id])
    end

    if @current_cart.nil?
      @current_cart = Cart.create
      session[:cart_id] = @current_cart.id
    end

    @current_cart
  end
end
