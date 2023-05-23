class Result < ApplicationRecord

  validates_presence_of :subject, :timestamp
  validates :marks, numericality: { only_integer: false, greater_than_or_equal_to: 0, less_than_or_equal_to: 100 }

end
