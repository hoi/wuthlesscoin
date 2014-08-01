class CreateCoins < ActiveRecord::Migration
  def change
    create_table :coins do |t|
      t.string :name
      t.integer :num_coins

      t.timestamps
    end
  end
end
