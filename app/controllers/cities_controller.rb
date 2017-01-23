class CitiesController < ApplicationController
  before_action :set_city, only: [:show, :update, :destroy]


  def index
    @citites = City.all

    #render json: @citites
  end

  def show
    #render json: @city
  end

  def create
    @city = City.new(city_params)

    if @city.save
      #render json: @city, status: :created, location: @city
      render :show, status: :created, location: @city
    else
      render json: @city.errors, status: :unprocessable_entity
    end
  end

  def update
    @city = City.find(params[:id])

    if @city.update(city_params)
      head :no_content
    else
      render json: @city.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @city.destroy

    head :no_content
  end

  private

    def set_city
      @city = City.find(params[:id])
    end

    def city_params
      params.require(:city).permit(:name)
    end
end
