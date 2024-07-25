class PurchasesController < ApplicationController
  before_action :set_cart, only: %i[checkout create]

  def index
    @purchases = Purchase.all
  end

  def show
    @purchase = Purchase.find(params[:id])
  end

  def checkout
    @purchase = Purchase.new
  end

  def new
    @purchase = Purchase.new
  end

  def create
    @purchase = Purchase.new(purchase_params)
    @purchase.user = current_user
    @purchase.cart_id = @cart.id # Asignar directamente el cart_id

    if @purchase.save
      session[:cart_id] = nil # Limpiar el carrito después de la compra
      redirect_to confirmation_purchase_path(@purchase)
    else
      flash[:alert] = @purchase.errors.full_messages.to_sentence
      Rails.logger.debug("Purchase creation failed: #{@purchase.errors.full_messages}")
      render 'checkout'
    end
  end

  def edit
    @purchase = Purchase.find(params[:id])
  end

  def update
    @purchase = Purchase.find(params[:id])
    if @purchase.update(purchase_params)
      redirect_to @purchase
    else
      render 'edit'
    end
  end

  def destroy
    @purchase = Purchase.find(params[:id])
    @purchase.destroy
    redirect_to purchases_path
  end

  def confirmation
    @purchase = Purchase.find(params[:id])
  end

  private

  def set_cart
    @cart = Cart.find(session[:cart_id])
  end

  def purchase_params
    params.require(:purchase).permit(:address, :payment_method, :country, :first_name, :last_name, :postal_code,
                                     :commune, :region, :phone, :billing_address, :shipping_method)
  end
end
