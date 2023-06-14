class UserController < ApplicationController
  def index
    @favorite = Favorite.all
    @favorite = Favorite.find_by(user: current_user, concert: @concert)
  end
end
