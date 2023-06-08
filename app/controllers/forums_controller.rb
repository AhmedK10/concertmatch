class ForumsController < ApplicationController
  def index
    @concert = Concert.find(params[:concert_id])
    @forums = @concert.forums
    
    if params[:query].present?
      @forums = @forums.where("board ILIKE ?", "%#{params[:query]}%")
    end

    board_type = params[:board_type]

    if board_type == "accommodation"
      @forums = @forums.where(board: :accommodation)
    elsif board_type == "travel"
      @forums = @forums.where(board: :travel)
    else
      @forums = @forums.where(board: :buddies)
    end
  end

  def show
    @forum = Forum.find(params[:id])
    @comment = Comment.new
  end
end
