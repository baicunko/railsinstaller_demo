class SignalData < ActiveRecord::Base
  establish_connection(:external_db)
  set_table_name 'Senales'
  attr_accessible :Latitud, :Longitud, :Operador, :Intensidad
  

  #reverse_geocoded_by :Latitud, :Longitud
  #after_validation :geocode          # auto-fetch coordinates

  acts_as_mappable :default_units => :kms, 
                   :default_formula => :sphere, 
                   :distance_field_name => :distance,
                   :lat_column_name => :Latitud,
                   :lng_column_name => :Longitud




  
end
