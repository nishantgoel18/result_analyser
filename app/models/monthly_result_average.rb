class MonthlyResultAverage < ApplicationRecord

  validates_presence_of :subject, :month, :date
  validates :monthly_avg_high, numericality: { only_integer: false, greater_than_or_equal_to: 0, less_than_or_equal_to: 100 }
  validates :monthly_avg_low, numericality: { only_integer: false, greater_than_or_equal_to: 0, less_than_or_equal_to: 100 }
  validates :monthly_result_count_used, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  validates :month, inclusion: { in: Date::MONTHNAMES }

  def self.campute_stat_for(subject, date)
    daily_result_stats, result_count = get_results_from_date(date, subject)
    daily_volumes_sum = daily_result_stats.sum { |stats| stats[:result_count] }
    daily_low_sum = daily_result_stats.map do |stats|
      stats[:daily_low] * stats[:result_count] if stats[:daily_low]
    end.compact.sum
    daily_high_sum = daily_result_stats.map do |stats|
      stats[:daily_high] * stats[:result_count] if stats[:daily_high]
    end.compact.sum
    monthly_avg_low = daily_low_sum / daily_volumes_sum if daily_low_sum
    monthly_avg_high = daily_high_sum / daily_volumes_sum if daily_high_sum
    
    MonthlyResultAverage.create(month: Date::MONTHNAMES[Date.parse(date).month], date: date, subject: subject, monthly_avg_low: monthly_avg_low.round(2), monthly_avg_high: monthly_avg_high.round(2), monthly_result_count_used: result_count)
    
    { month: Date::MONTHNAMES[Date.parse(date).month], subject: subject, monthly_avg_low: monthly_avg_low.round(2), monthly_avg_high: monthly_avg_high.round(2), monthly_result_count: result_count}
  end

  def self.get_results_from_date(date, subject)
    min_results_count = 200

    date_range = (Date.parse(date) - 5.days)..Date.parse(date)
    result_count = 0
    daily_result_stats = []
    return if Result.minimum(:timestamp).nil?

    while result_count < min_results_count && date_range.first >= Result.minimum(:timestamp).to_date

      daily_result_stats = date_range.map { |date| DailyResultStat.campute_stat_for(subject, date) }

      result_count = daily_result_stats.sum { |stats| stats[:result_count] }

      date_range = (date_range.first - 1.day)..date_range.last if result_count < min_results_count
    end
    return daily_result_stats, result_count
  end
end
