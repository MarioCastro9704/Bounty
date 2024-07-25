class CartsController < ApplicationController
  def show
    @cart = current_cart
  end

  def add
    @cart = current_cart
    product = Product.find(params[:product_id])
    item = @cart.add_product(product)

    if item.errors.any?
      flash[:alert] = item.errors.full_messages.to_sentence
    else
      flash[:notice] = 'Producto agregado al carrito.'
    end

    redirect_to cart_path
  end

  def remove
    @cart = current_cart
    item = @cart.cart_items.find_by(product_id: params[:product_id])
    item&.destroy
    redirect_to cart_path
  end

  def update
    @cart = current_cart
    item = @cart.cart_items.find(params[:id])
    if params[:quantity].to_i <= item.product.quantity_available
      item.update(quantity: params[:quantity]) if params[:quantity].to_i.positive?
    else
      flash[:alert] = "No hay suficiente stock disponible para actualizar la cantidad."
    end
    redirect_to cart_path
  end

  private

  def current_cart
    @current_cart ||= Cart.find(session[:cart_id]) if session[:cart_id]
    if @current_cart.nil?
      @current_cart = Cart.create
      session[:cart_id] = @current_cart.id
    end
    @current_cart
  end
end
