class Event < ActiveRecord::Base
  attr_accessible :date, :description, :name, :rating
  validates_presence_of :date, :description, :name
  validates :rating, numericality: {:greater_than=>0, :less_than=>6}, if: "rating.present?"
  
end
