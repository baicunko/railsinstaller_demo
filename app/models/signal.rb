class Signaliso < ActiveRecord::Base
  establish_connection(:external_db)
  set_table_name 'signals'
end