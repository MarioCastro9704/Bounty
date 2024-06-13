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
    if @purchase.save
      session[:cart_id] = nil # Limpiar el carrito después de la compra
      redirect_to @purchase
    else
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

  private

  def set_cart
    @cart = Cart.find(params[:cart_id])
  end

  def purchase_params
    params.require(:purchase).permit(:user_id, :address, :payment_method, :cart_id)
  end
end
