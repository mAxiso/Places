class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string :name
      t.string :description
      t.string :date
      t.integer :rating

      t.timestamps
    end
  end
end
