class ConcertsController < ApplicationController
  skip_before_action :authenticate_user!, only: %i[index show]

  def index
    @concerts = Concert.all
    if params[:query].present?
      sql_subquery = "genre ILIKE :query OR summary ILIKE :query"

      @concerts = @concerts.where("genre ILIKE ?", "%#{params[:query]}%")
    end
  end

  def show
    @concert = Concert.find(params[:id])
  end
end
