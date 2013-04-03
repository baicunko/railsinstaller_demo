class SignalData < ActiveRecord::Base
  establish_connection(:external_db)
  set_table_name 'Senales'
  attr_accessible :Latitd, :Longitud, :Operador, :Intensidad
  
end
