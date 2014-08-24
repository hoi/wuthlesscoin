class CreateRpiIps < ActiveRecord::Migration
  def change
    create_table :rpi_ips do |t|
      t.string :ip
      t.string :rpi_id
      t.datetime :ping

      t.timestamps
    end
  end
end
