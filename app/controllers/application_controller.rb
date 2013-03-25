class ApplicationController < ActionController::Base
  protect_from_forgery

  def getSignal   
    signal = Signal.first #signal.as_json
    respond_to do |format| 
      format.json {render signal} 
    end
  end


end
