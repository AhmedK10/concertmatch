class PagesController < ApplicationController
  skip_before_action :authenticate_user!

  def home
    @concerts = Concert.all.first(3)
  end

  def kitchen_sink
  end
end
