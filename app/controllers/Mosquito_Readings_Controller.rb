class MosquitoReadingsController < ApplicationController
  def index
    @mosquito_trap = MosquitoTrap.find(params[:mosquito_trap_id])
    @readings = @mosquito_trap.mosquito_readings
  end

  def show
    @reading = MosquitoReading.find(params[:id])
  end
end
