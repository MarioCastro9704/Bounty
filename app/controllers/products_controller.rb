class ProductsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_product, only: [:show, :edit, :update, :destroy]
  before_action :authorize_user!, only: [:edit, :update, :destroy]

  def index
    @products = current_user.products
  end

  def catalog
    @products = Product.all
  end

  def show
  end

  def new
    @product = Product.new
  end

  def create
    @product = current_user.products.build(product_params)
    if @product.save
      redirect_to @product, notice: 'Producto creado exitosamente.'
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @product.update(product_params)
      redirect_to @product, notice: 'Producto actualizado exitosamente.'
    else
      render :edit
    end
  end

  def destroy
    @product.destroy
    redirect_to products_url, notice: 'Producto eliminado exitosamente.'
  end

  private

  def set_product
    @product = current_user.products.find_by(id: params[:id])
    redirect_to products_path, alert: 'Producto no encontrado' if @product.nil?
  end

  def product_params
    params.require(:product).permit(:product_type, :price, :description, :model, :brand, :image_url, :release_date, :quantity_available, :size)
  end

  def authorize_user!
    redirect_to products_path, alert: 'No autorizado' unless @product.user == current_user
  end
end
