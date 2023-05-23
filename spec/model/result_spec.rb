# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Result, type: :model do
  describe 'validations' do
    let(:result) { build(:result) }
    it 'is valid with valid attributes' do
      expect(result).to be_valid
    end

    it 'is not valid without a subject' do
      result.subject = nil
      expect(result).not_to be_valid
    end

    it 'is not valid without marks' do
      result.marks = nil
      expect(result).not_to be_valid
    end

    it 'is not valid without timestamp' do
      result.timestamp = nil
      expect(result).not_to be_valid
    end

    it 'is valid with a valid marks decimal' do
      result.marks = 91.98
      expect(result).to be_valid
    end

    it 'is invalid with a invalid marks' do
      result.marks = 1000.0
      expect(result).not_to be_valid
    end

  end
end
