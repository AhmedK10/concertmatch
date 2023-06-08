class CommentsController < ApplicationController
  def create
    @forum = Forum.find(params[:forum_id])
    @comment = Comment.new(comment_params)
    @comment.forum = @forum
    @comment.user = current_user

    if @comment.save
      redirect_to forum_comments_path(@forum)
    else
      render "forums/show", :unprocessable_entity
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:content)
  end
end
