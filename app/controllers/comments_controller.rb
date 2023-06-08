class CommentsController < ApplicationController
  def new
    @comment = Comment.new
  end

  def create
    @forum = Forum.find(params[:forum_id])
    @comment = @forum.comments.build(comment_params)

    if @comment.save
      redirect_to concert_forum_path(@forum)
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:content)
  end
end
