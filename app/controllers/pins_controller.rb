class PinsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_pin, only: [:show, :edit, :update, :destroy]

  def index
    @pins = Pin.all
  end

  def show
  end

  def new
    @pin = current_user.pins.build
  end

  def edit
  end

  def create
    @pin = current_user.pins.build(params[:id])
    if @pin.save
      redirect_to @pin, notice: 'Pin Created, Yo!'
    else
      render_action 'new'
    end
  end

  def update
    if @pin.update(pin_params)
      redirect_to @pin, notice: 'Pin was successfully updated'
    else
      render_edit
    end
  end

  def destroy
    @pin.destroy
    redirect_to pins_path
  end

  private
    def set_pin
      @pin = Pin.find(params[:id])
    end

    def correct_user
      @pin = current_user.pins.find_by(params[:id])
      redirect_to pins_path, notice: "not authorized to edit this pin" if @pin.nil?

    def pin_params
      params.require(:pin).permit(:description, :image)
    end
  end
end
