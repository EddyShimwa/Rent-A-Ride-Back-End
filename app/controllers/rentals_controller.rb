class RentalsController < ApplicationController
  before_action :set_rental, only: %i[ show update destroy ]

  # GET /rentals
  def index
    @rentals = Rental.all

    render json: @rentals
  end

  # GET /rentals/1
  def show
    render json: @rental
  end

  # POST /rentals
  def create
    @rental = Rental.new(rental_params)

    if @rental.save
      render json: @rental, status: :created, location: @rental
    else
      render json: @rental.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /rentals/1
  def update
    if @rental.update(rental_params)
      render json: @rental
    else
      render json: @rental.errors, status: :unprocessable_entity
    end
  end

  # DELETE /rentals/1
  def destroy
    @rental.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_rental
      @rental = Rental.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def rental_params
      params.require(:rental).permit(:start_date, :end_date, :city, :price_per_day, :car_id, :user_id)
    end
end
