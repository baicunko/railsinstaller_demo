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
  	#data = SignalData.where("(Latitud < "+lat+"+0.001 and Latitud > "+lat+"-0.001) and (Longitud < "+lng+"+0.01 and Longitud > "+lng+"-0.01)")
    signal = SignalData.new(:Latitud=>lat,:Longitud=>lng)
    data = signal.nearbys(0.0310685596)

    respond_to do |format|
      format.json { render json: data }
    end
  end



end
