# frozen_string_literal: true

FactoryBot.define do
  factory :monthly_result_average do
    subject { 'Maths' }
    month { "January" }
    date {Date.today}
    monthly_avg_low { 11.80 }
    monthly_avg_high { 91.89 }
    monthly_result_count_used { 20 }
  end
end
