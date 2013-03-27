class WelcomeController < ApplicationController
  def index
  	@signalData = SignalData.first
  	@lat = @signalData.Latitud
  	@lng = @signalData.Longitud
  	@op = @signalData.Operador
  	@int = @signalData.Intensidad
  end
end
