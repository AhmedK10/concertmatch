class UserController < ApplicationController
  def index
    # @user = current_user
    @favorite = Favorite.all
    @favorite = Favorite.find_by(user: current_user, concert: @concert)
  end
end
