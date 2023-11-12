# frozen_string_literal: true

RSpec.describe TicketDateTime, type: :model do
  describe 'associations' do
    it { is_expected.to belong_to(:ticket) }
  end

  describe 'validations' do
    it 'has a valid factory' do
      expect(build(:ticket_date_time)).to be_valid
    end

    it 'is invalid without a response_due_date_time' do
      ticket = build(:ticket_date_time, response_due_date_time: nil)
      expect(ticket).not_to be_valid
      expect(ticket.errors[:response_due_date_time]).to include("can't be blank")
    end
  end
end
