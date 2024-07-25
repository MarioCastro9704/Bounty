# app/controllers/products_controller.rb
class ProductsController < ApplicationController
  before_action :authenticate_user!, except: %i[show catalog autocomplete]
  before_action :set_product, only: %i[show edit update destroy]
  before_action :authorize_user!, only: %i[edit update destroy]

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
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    if @product.update(product_params)
      redirect_to @product, notice: 'Producto actualizado exitosamente.'
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @product.destroy
    redirect_to products_url, notice: 'Producto eliminado exitosamente.'
  end

  def autocomplete
    if params[:query].present?
      @products = Product.search_by_attributes(params[:query]).limit(3)
    else
      @products = Product.none
    end

    respond_to do |format|
      format.json { render json: @products.to_json(only: %i[id model brand price], methods: [:image_url]) }
    end
  end

  private

  def set_product
    @product = Product.find(params[:id])
  end

  def product_params
    params.require(:product).permit(:category_id, :price, :description, :model, :brand, :image, :release_date,
                                    :quantity_available, :size)
  end

  def authorize_user!
    redirect_to products_path, alert: 'No autorizado' unless @product.user == current_user
  end
end
