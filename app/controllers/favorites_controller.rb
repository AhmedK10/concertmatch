class FavoritesController < ApplicationController
  # def new
  #   @favorite = Favorite.new
  #   @user = Use.find(params[:user_id])
  # end

  def create
    @concert = Concert.find(params[:concert_id])
    @favorite = current_user.favorites.new(concert: @concert)
    # @favorite = Favorite.find(params[:favorite])
    # @user = User.find(params[:user])
    # @favorite.concert = @concert
    # @favorite.user = current_user
    if @favorite.save
      redirect_to concert_path(@concert), notice: "Added to favorite"
    else
      redirect_to concert_path(@concert), notice: @favorite.errors.full_messages[0]
    end
  end

  def destroy
    @favorite = Favorite.find(params[:id])
    @concert = Concert.where(user: current_user, favorites: @favorite)
    if @favorite.destroy
      redirect_to concert_path(@concert), notice: "removed from favorite"
    else
      render 'new'
    end
  end
end
