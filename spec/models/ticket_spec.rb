# frozen_string_literal: true

RSpec.describe Ticket, type: :model do
  describe 'associations' do
    it { is_expected.to have_one(:excavator).dependent(:destroy) }
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

    it 'is invalid without a response_due_date_time' do
      ticket = build(:ticket, response_due_date_time: nil)
      expect(ticket).not_to be_valid
      expect(ticket.errors[:response_due_date_time]).to include("can't be blank")
    end

    it 'is invalid without a primary_service_area_code' do
      ticket = build(:ticket, primary_service_area_code: nil)
      expect(ticket).not_to be_valid
      expect(ticket.errors[:primary_service_area_code]).to include("can't be blank")
    end

    it 'is invalid without additional_service_area_codes' do
      ticket = build(:ticket, additional_service_area_codes: nil)
      expect(ticket).not_to be_valid
      expect(ticket.errors[:additional_service_area_codes]).to include("can't be blank")
    end

    it 'is invalid without well_known_text' do
      ticket = build(:ticket, well_known_text: nil)
      expect(ticket).not_to be_valid
      expect(ticket.errors[:well_known_text]).to include("can't be blank")
    end
  end
end
