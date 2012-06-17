class CreatePlaces < ActiveRecord::Migration
  def change
    create_table :places do |t|
      t.string :name
      t.string :description
      t.string :adress
      t.string :phone

      t.timestamps
    end
  end
end
