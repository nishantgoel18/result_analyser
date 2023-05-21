class Result < ApplicationRecord

  validates_presence_of :subject
  validates :marks, numericality: { only_integer: false, min: 0.0, max: 100.0 }

end
