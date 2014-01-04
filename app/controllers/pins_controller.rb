class PinsController < ApplicationController
  before_action :set_pin, only: [:show, :edit, :update, :destroy]

  def index
     @pins = Pin.all
  end

  def show
  end

  def new
    @pin = Pin.new
  end

  def edit
  end

  def create
    @pin = Pin.new(pin_params)
    if @pin.save
      redirect_to @pin, notice: 'Pin was successfully created.'
      #Comment out for Now TDB
      #format.json { render action: 'show', status: :created, location: @pin }
    else
      render action: 'new'
      #Comment out for Now TDB
      #format.json { render json: @pin.errors, status: :unprocessable_entity }
    end
  end

  def update
    if @pin.update(pin_params)
      redirect_to @pin, notice: 'Pin was successfully updated.'
      #Comment out for Now TDB
      #format.json { head :no_content }
    else
      render action: 'edit'
      #Comment out for Now TDB
      #format.json { render json: @pin.errors, status: :unprocessable_entity }
    end
  end

  def destroy
    @pin.destroy
    redirect_to pins_url
    #Comment out for Now TDB
    #format.json { head :no_content }
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_pin
      @pin = Pin.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def pin_params
      params.require(:pin).permit(:description)
    end
end
