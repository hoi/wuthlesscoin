class CreateMashes < ActiveRecord::Migration
  def change
    create_table :mashes do |t|
      t.string :val

      t.timestamps
    end
  end
end
