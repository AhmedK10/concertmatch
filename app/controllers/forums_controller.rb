class ForumsController < ApplicationController
  def index
    @concert = Concert.find(params[:concert_id])
    @forums = @concert.forums.order(created_at: :desc)
    @forum = Forum.new

    if params[:query].present?
      @forums = @forums.where("board ILIKE ?", "%#{params[:query]}%")
    end

    if params[:board_type].present?
      @forums = @forums.where(board: params[:board_type])
    end

    if params[:gender].present?
      @forums = @forums.joins(:user).where(users: { gender: params[:gender] })
    end

    if params[:age_range].present?
      case params[:age_range]
      when "18-25"
        @forums = @forums.joins(:user).where("users.date_of_birth >= ? AND users.date_of_birth <= ?", 25.years.ago, 18.years.ago)
      when "26-35"
        @forums = @forums.joins(:user).where("users.date_of_birth >= ? AND users.date_of_birth <= ?", 35.years.ago, 26.years.ago)
      when "36-45"
        @forums = @forums.joins(:user).where("users.date_of_birth >= ? AND users.date_of_birth <= ?", 45.years.ago, 36.years.ago)
      when "46-60"
        @forums = @forums.joins(:user).where("users.date_of_birth >= ? AND users.date_of_birth <= ?", 60.years.ago, 46.years.ago)
      when "60+"
        @forums = @forums.joins(:user).where("users.date_of_birth <= ?", 60.years.ago)
      end
    end
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
