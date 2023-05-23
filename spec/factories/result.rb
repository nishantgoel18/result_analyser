# frozen_string_literal: true

FactoryBot.define do
  factory :result do
    subject { 'Maths' }
    marks { 95.0 }
    timestamp {'2022-04-23 12:02:44.678'}
  end
end
