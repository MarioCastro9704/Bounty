class RatingsController < ApplicationController
  before_action :authenticate_user!

  def create
    @product = Product.find(params[:product_id])
    @rating = @product.ratings.build(rating_params)
    @rating.user = current_user

    if @rating.save
      redirect_to @product, notice: 'Rating was successfully created.'
    else
      redirect_to @product, alert: 'Rating could not be created.'
    end
  end

  private

  def rating_params
    params.require(:rating).permit(:score)
  end
end
