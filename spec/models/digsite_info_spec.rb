# frozen_string_literal: true

RSpec.describe DigsiteInfo, type: :model do
  describe 'associations' do
    it { is_expected.to belong_to(:ticket) }
  end

  describe 'validations' do
    it 'has a valid factory' do
      expect(build(:digsite_info)).to be_valid
    end

    it 'is invalid without a well_known_text' do
      digsite_info = build(:digsite_info, well_known_text: nil)
      expect(digsite_info).not_to be_valid
      expect(digsite_info.errors[:well_known_text]).to include("can't be blank")
    end
  end
end
