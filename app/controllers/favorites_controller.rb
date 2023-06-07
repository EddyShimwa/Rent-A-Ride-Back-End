class FavoritesController < ApplicationController
  def index
    @favorites = Favorite.all
    render json: @favorites
  end

  def show
    @favorite = Favorite.find(params[:id])
    render json: @favorite
  end

  def create
    @favorite = Favorite.create(favorite_params)
    if @favorite.valid?
      render json: @favorite, status: :created
    else
      render json: { error: 'failed to create favorite' }, status: :not_acceptable
    end
  end

  def destroy
    @favorite = Favorite.find(params[:id])
    if @favorite.destroy
      render json: { success: true, message: 'Favorite deleted successfully' }
    else
      render json: { success: false, error: 'Failed to delete favorite' }
    end
  end

  private

  def favorite_params
    params.permit(:user_id, :car_id, :name, :description, :image)
  end
end
