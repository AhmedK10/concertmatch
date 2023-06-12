class ConcertsController < ApplicationController
  skip_before_action :authenticate_user!, only: %i[index show]

  def index
    @concerts = Concert.all
    if params[:query].present? && params[:query] != ""
      sql_subquery = <<~SQL
        genre ILIKE :query
        OR summary ILIKE :query
        OR concerts.name ILIKE :query
        OR artist ILIKE :query
      SQL
      @concerts = @concerts.where(sql_subquery, query: "%#{params[:query]}%")
    end

    if params[:genre].present?
      @concerts = @concerts.where(genre: params[:genre])
    end

    if params[:start_date].present? && params[:end_date].present?
      start_date = Date.parse(params[:start_date])
      end_date = Date.parse(params[:end_date])
      @concerts = @concerts.where(date: start_date..end_date)
    end
  end

  def show
    @concert = Concert.find(params[:id])
    @favorites = @concert.favorites
  end
end
