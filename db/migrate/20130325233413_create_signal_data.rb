class CreateSignalData < ActiveRecord::Migration
  def change
    create_table :signal_data do |t|

      t.timestamps
    end
  end
end
