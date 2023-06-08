class FavoritesController < ApplicationController

  def new
    @favorite = Favorite.new
    @user = Use.find(params[:user_id])
  end

  def create
    @favorite = Favorite.find(params[:favorite])
    @user = User.find(params[:user])
    @favorite.user = @user
    if favorite.save
      redirect_to concert_path(@concert)
    else
      render 'new'
    end
  end
end
