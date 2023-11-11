# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Tickets::Create, type: :service do
  describe '#call' do
    subject(:create_ticket) { described_class.call(params) }

    context 'when valid parameters are provided' do
      let(:ticket_attributes) { attributes_for(:ticket) }
      let(:excavator_attributes) { attributes_for(:excavator) }
      let(:params) { ticket_attributes.merge(excavator: excavator_attributes) }

      it 'creates a ticket and an excavator' do
        expect { create_ticket }.to change { Ticket.count }.by(1)
                                                           .and change { Excavator.count }.by(1)

        expect(create_ticket).to include(status: :created, message: 'Ticket and Excavator created successfully.')
        expect(create_ticket[:ticket_id]).not_to be_nil
      end
    end

    context 'when invalid parameters are provided' do
      let(:params) { { request_number: nil } }

      it 'does not create a ticket or excavator' do
        expect { create_ticket }.not_to(change { Ticket.count })
        expect { create_ticket }.not_to(change { Excavator.count })

        expect(create_ticket).to include(status: :unprocessable_entity)
        expect(create_ticket[:error]).to be_present
      end
    end
  end
end
