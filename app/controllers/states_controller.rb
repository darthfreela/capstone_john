class StatesController < ApplicationController
  before_action :set_states, only: [:show, :update, :destroy]


  def index
    @states = State.all

    #render json: @states
  end


  def show
    #render json: @state
  end


  def create
    @state = State.new(State_params)

    if @state.save
      render :show, status: :created, location: @state
    else
      render json: @state.errors, status: :unprocessable_entity
    end
  end


  def update
    @state = State.find(params[:id])

    if @state.update(State_params)
      head :no_content
    else
      render json: @state.errors, status: :unprocessable_entity
    end
  end

  # DELETE /states/1
  # DELETE /states/1.json
  def destroy
    @state.destroy

    head :no_content
  end

  private

    def set_state
      @state = State.find(params[:id])
    end

    def State_params
      params.require(:state).permit(:name)
    end
end
