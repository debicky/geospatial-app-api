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
end
