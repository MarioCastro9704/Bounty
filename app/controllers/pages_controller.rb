# app/controllers/pages_controller.rb
class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: :home

  def home
    if params[:query].present?
      @products = Product.search_by_attributes(params[:query]).limit(5)
      if @products.any?
        redirect_to product_path(@products.first) and return
      else
        flash.now[:alert] = "No se encontró el producto."
      end
    end

    @latest_releases = Product.order(created_at: :desc).limit(6)
    @recently_added = Product.order(created_at: :desc).limit(6)
    @best_sellers = Product.joins(:purchases).group('products.id').order('COUNT(purchases.id) DESC').limit(6)
  end
end
