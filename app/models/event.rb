class Event < ActiveRecord::Base
  belongs_to :place
  attr_accessible :date, :description, :name, :rating, :place_id
  
  validates_presence_of :date, :description, :name
  validates :rating, numericality: {:greater_than=>0, :less_than=>6}, if: "rating.present?"
  
end
