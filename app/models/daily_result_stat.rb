class DailyResultStat < ApplicationRecord

  validates_presence_of :subject, :date
  validates :daily_high, numericality: { only_integer: false, greater_than_or_equal_to: 0, less_than_or_equal_to: 100 }
  validates :daily_low, numericality: { only_integer: false, greater_than_or_equal_to: 0, less_than_or_equal_to: 100 }
  validates :result_count, numericality: { only_integer: true, greater_than_or_equal_to: 0 }

  def self.campute_stat_for(subject, date)
    results = Result.where('timestamp >= ? AND timestamp <= ?', date.to_datetime.beginning_of_day, date.to_datetime.end_of_day).where(subject: subject)
    daily_low = results.minimum(:marks)
    daily_high = results.maximum(:marks)
    result_count = results.count
    DailyResultStat.create(date: date, subject: subject, daily_low: daily_low, daily_high: daily_high, result_count: result_count)

    return { date: date, subject: subject, daily_low: daily_low, daily_high: daily_high, result_count: result_count }
  end
end
