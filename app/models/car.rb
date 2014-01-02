class Car < ActiveRecord::Base
  validates_presence_of :make
  validates_presence_of :color
  validates_numericality_of :mileage, only_integer: true
  validates_numericality_of :year, greater_than: 1979
end
