# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Tickets::Create, type: :service do
  describe '#call' do
    subject(:create_ticket) { described_class.call(params) }

    context 'when valid parameters are provided' do
      let(:ticket) { build(:ticket) }
      let(:excavator) { build(:excavator, ticket:) }
      let(:ticket_date_time) { build(:ticket_date_time, ticket:) }
      let(:service_area) { build(:service_area, ticket:) }
      let(:primary_service_area_code) { build(:primary_service_area_code, service_area:) }
      let(:additional_service_area_codes) { build(:additional_service_area_code, service_area:) }
      let(:digsite_info) { build(:digsite_info, ticket:) }

      let(:params) do
        {
          RequestNumber: ticket.request_number,
          SequenceNumber: ticket.sequence_number,
          RequestType: ticket.request_type,
          RequestAction: ticket.request_action,
          DateTimes: {
            ResponseDueDateTime: ticket_date_time.response_due_date_time
          },
          ServiceArea: {
            PrimaryServiceAreaCode: {
              SACode: primary_service_area_code.sa_code
            },
            AdditionalServiceAreaCodes: {
              SACode: additional_service_area_codes.sa_code
            }
          },
          ExcavationInfo: {
            DigsiteInfo: {
              WellKnownText: digsite_info.well_known_text
            }
          },
          Excavator: {
            CompanyName: excavator.company_name,
            Address: excavator.address,
            CrewOnsite: excavator.crew_on_site
          }
        }
      end

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
