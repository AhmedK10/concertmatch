class ConcertsController < ApplicationController
  skip_before_action :authenticate_user!, only: %i[index show]

  def index
    @concerts = Concert.all
    if params[:query].present?
      sql_subquery = <<~SQL
        genre ILIKE :query
        OR summary ILIKE :query
        OR concerts.name ILIKE :query
        OR artist ILIKE :query
      SQL
      @concerts = @concerts.where(sql_subquery, query: "%#{params[:query]}%")
    end
  end

  def show
    @concert = Concert.find(params[:id])
  end
end
