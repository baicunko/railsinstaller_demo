class SignalData < ActiveRecord::Base
  establish_connection(:external_db)
  set_table_name 'Senales'
  attr_accessible :Latitud, :Longitud, :Operador, :Intensidad
  

  reverse_geocoded_by :Latitud, :Longitud
  after_validation :geocode          # auto-fetch coordinates




  
end
