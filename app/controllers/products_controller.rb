class ProductsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show, :catalog]

  def index
    @products = Product.all
  end

  def catalog
    @products = Product.all
  end

  def show
    @product = Product.find(params[:id])
  end

  def new
    @product = Product.new
  end

  def create
    @product = current_user.products.build(product_params)
    if @product.save
      redirect_to @product, notice: 'Producto creado exitosamente.'
    else
      render 'new'
    end
  end

  def edit
    @product = Product.find(params[:id])
  end

  def update
    @product = Product.find(params[:id])
    if @product.update(product_params)
      redirect_to products_path, notice: 'Producto actualizado exitosamente.'
    else
      render 'edit'
    end
  end

  def destroy
    @product = Product.find(params[:id])
    @product.destroy
    redirect_to products_path, notice: 'Producto eliminado exitosamente.'
  end

  private

  def product_params
    params.require(:product).permit(:category, :price, :description, :model, :brand, :image_url, :release_date, :available)
  end
end
