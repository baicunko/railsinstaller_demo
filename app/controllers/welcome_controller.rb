class WelcomeController < ApplicationController
  def index
  	@signalData = SignalData.last
  	@lat = @signalData.Latitud
  	@lng = @signalData.Longitud
  	@op = @signalData.Operador
  	@int = @signalData.Intensidad
  end

  def getSignal
  	lat = params[:lat]
  	lng = params[:lng]
  	data = SignalData.where("(Latitud < "+lat+"+0.1 and Latitud > "+lat+"-0.1) and (Longitud < "+lng+"+0.1 and Longitud > "+lng+"-0.1)")
    respond_to do |format|
      format.json { render json: data }
    end
  end



end
