class ForumsController < ApplicationController
  def index
    @concert = Concert.find(params[:concert_id])
    @forums = @concert.forums
  end
end
