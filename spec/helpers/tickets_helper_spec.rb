# frozen_string_literal: true

RSpec.describe TicketsHelper, type: :helper do
  describe '#crew_on_site_present?' do
    subject(:crew_status) { helper.crew_on_site_present?(excavator) }

    context 'when crew is on site' do
      let(:excavator) { create(:excavator, crew_on_site: true) }

      it 'returns Yes' do
        expect(crew_status).to eq('Yes')
      end
    end

    context 'when crew is not on site' do
      let(:excavator) { create(:excavator, crew_on_site: false) }

      it 'returns No' do
        expect(crew_status).to eq('No')
      end
    end
  end

  describe '#formatted_response_due_date_time' do
    subject(:formatted_date) { helper.formatted_response_due_date_time(response_due_date_time) }

    let(:response_due_date_time) { Time.zone.local(2022, 1, 1, 12, 0, 0) }

    it 'returns the formatted date and time' do
      expect(formatted_date).to eq('2022-01-01 12:00:00')
    end

    context 'when response_due_date_time is nil' do
      let(:response_due_date_time) { nil }

      it 'returns nil' do
        expect(formatted_date).to be_nil
      end
    end
  end
end
