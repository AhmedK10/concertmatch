class ForumsController < ApplicationController
  def index
    @concert = Concert.find(params[:concert_id])
    @forums = @concert.forums

    #forum type filter
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

    #User filter
    @users = User.all

    #gender filter
    if params[:query].present?
      @users = @users.where("gender ILIKE ?", "%#{params[:query]}%")
    end
    gender = params[:gender]
    if gender == "male"
      @forums = @forums.select { |forum| forum.user.gender == "male"}
    elsif gender == "female"
      @forums = @forums.select { |forum| forum.user.gender == "female"}
    else
      @forums = @forums.select { |forum| forum.user.gender == "other"}
    end

    #age filter
    if params[:query].present?
      @users = @users.where("age ILIKE ?", "%#{params[:query]}%")
    end

    age = params[:age]
    if age.to_i > 18 && age.to_i < 25
      @forums = @forums.select { |forum| forum.user.age >= 18 && forum.user.age <= 25 }
    elsif age
      @forums = @forums.select { |forum| forum.user.age >= 25 && forum.user.age <= 35 }
    elsif age
      @forums = @forums.select { |forum| forum.user.age >= 35 && forum.user.age <= 45 }
    elsif age
      @forums = @forums.select { |forum| forum.user.age >= 45 && forum.user.age <= 55 }
    elsif age
      @forums = @forums.select { |forum| forum.user.age >= 55 && forum.user.age <= 65 }
    elsif age
      @forums = @forums.select { |forum| forum.user.age >= 65 && forum.user.age <= 75 }
    end

  end

  def show
    @forum = Forum.find(params[:id])
    @comment = Comment.new
  end
end
