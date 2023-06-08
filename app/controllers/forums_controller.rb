class ForumsController < ApplicationController
  def index
    @concert = Concert.find(params[:concert_id])
    @forums = @concert.forums.order(created_at: :desc)
    @forum = Forum.new
  end

  def show
    @forum = Forum.find(params[:id])
    @comment = Comment.new
  end

  def create
    @concert = Concert.find(params[:concert_id])
    puts forum_params
    @forum = Forum.new(forum_params)
    @forum.concert = @concert
    @forum.user = current_user

    if @forum.save
      redirect_to concert_forums_path(@concert)
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def forum_params
    params.require(:forum).permit(:content, board: { accommodation: 0, travel: 1, buddies: 2 })
  end
end
