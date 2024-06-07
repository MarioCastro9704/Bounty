class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: :home

  def home
    @latest_releases = Product.order(created_at: :desc).limit(6)
    @recently_added = Product.order(created_at: :desc).limit(6)
    @best_sellers = Product.joins(:purchases).group('products.id').order('COUNT(purchases.id) DESC').limit(6)
  end
end
