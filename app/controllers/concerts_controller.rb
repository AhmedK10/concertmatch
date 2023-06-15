class ConcertsController < ApplicationController
  skip_before_action :authenticate_user!, only: %i[index show]

  def index
    @concerts = Concert.all

    if params[:query].present? && params[:query] != ""
      @concerts = @concerts.where("name ILIKE :query OR artist ILIKE :query", query: "%#{params[:query]}%")
    end

    if params[:genre].present?
      @concerts = @concerts.where(genre: params[:genre])
    end

    if params[:start_date].present?
      start_date = Date.parse(params[:start_date])
      @concerts = @concerts.where("date >= ?", start_date)
    end

    if params[:artist].present?
      @concerts = @concerts.where("artist ILIKE ?", "%#{params[:artist]}%")
    end

    if params[:location].present?
      @concerts = @concerts.where("address ILIKE :location OR city ILIKE :location OR country ILIKE :location", location: "%#{params[:location]}%")
    end

    # if params[:start_date].present? && params[:end_date].present?
    #   start_date = Date.parse(params[:start_date])
    #   end_date = Date.parse(params[:end_date])
    #   @concerts = @concerts.where(date: start_date..end_date)
    # end

    if params[:start_date].blank? || params[:end_date].blank?
      @concerts = @concerts.order(date: :asc)
    end
  end

  def show
    @concert = Concert.find(params[:id])
    @favorites = @concert.favorites
  end
end
