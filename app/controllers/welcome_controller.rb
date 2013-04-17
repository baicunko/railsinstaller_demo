class WelcomeController < ApplicationController
  def index
  end

  def getSignal
  	lat = params[:lat]
  	lng = params[:lng]
  	
    data = SignalData.within(0.1, :origin=>[lat,lng]).order('Operador ASC')

    if data.first
      operador = data.first.Operador
      sumSignal = 0
      count = 0
      @avgSignal = Array.new
      
      data.each do |signal|
        if signal.Operador == operador
          sumSignal += signal.Intensidad
          count += 1
        else
          avg = sumSignal/count 
          @avgSignal.push([operador,avg]) #store results
          
          operador = signal.Operador #another company
          sumSignal = signal.Intensidad          
          count = 1
        end
      end


    end

    #data = SignalData.where("(Latitud < "+lat+"+0.001 and Latitud > "+lat+"-0.001) and (Longitud < "+lng+"+0.01 and Longitud > "+lng+"-0.01)")
    #signal = SignalData.new(:Latitud=>lat,:Longitud=>lng)
    #data = signal.nearbys(0.0310685596)

    respond_to do |format|
      format.json { render json: @avgSignal }
    end
  end



end
