# frozen_string_literal: true

RSpec.describe Ticket, type: :model do
  describe 'associations' do
    it { is_expected.to have_one(:excavator).dependent(:destroy) }
    it { is_expected.to have_one(:digsite_info).dependent(:destroy) }
    it { is_expected.to have_one(:ticket_date_time).dependent(:destroy) }
    it { is_expected.to have_one(:service_area).dependent(:destroy) }
  end

  describe 'validations' do
    it 'has a valid factory' do
      expect(build(:ticket)).to be_valid
    end

    it 'is invalid without a request_number' do
      ticket = build(:ticket, request_number: nil)
      expect(ticket).not_to be_valid
      expect(ticket.errors[:request_number]).to include("can't be blank")
    end

    it 'is invalid without a sequence_number' do
      ticket = build(:ticket, sequence_number: nil)
      expect(ticket).not_to be_valid
      expect(ticket.errors[:sequence_number]).to include("can't be blank")
    end

    it 'is invalid without a request_type' do
      ticket = build(:ticket, request_type: nil)
      expect(ticket).not_to be_valid
      expect(ticket.errors[:request_type]).to include("can't be blank")
    end

    it 'is invalid without a request_action' do
      ticket = build(:ticket, request_action: nil)
      expect(ticket).not_to be_valid
      expect(ticket.errors[:request_action]).to include("can't be blank")
    end
  end
end
