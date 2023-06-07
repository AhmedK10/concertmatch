class PagesController < ApplicationController
  skip_before_action :authenticate_user!

  def home
  end

  def kitchen_sink
  end
end
