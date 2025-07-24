class MosquitoTrapsController < ApplicationController
  def index
    @query = params[:query]
    @mosquito_traps = if @query
      MosquitoTrap.where("name ILIKE ?", "%#{@query}%")
    else
      MosquitoTrap.all
    end
  end

 def show
  @mosquito_trap = MosquitoTrap.find(params[:id])
  @readings = @mosquito_trap.mosquito_readings.order(date: :desc).page(params[:page]).per(5) # paginate, 5 per page
end
end
