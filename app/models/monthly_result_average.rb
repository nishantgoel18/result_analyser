class MonthlyResultAverage < ApplicationRecord

  validates_presence_of :subject, :month
  validates :monthly_high, numericality: { only_integer: false, greater_than_or_equal_to: 0, less_than_or_equal_to: 100 }
  validates :monthly_low, numericality: { only_integer: false, greater_than_or_equal_to: 0, less_than_or_equal_to: 100 }
  validates :results_count, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
end
