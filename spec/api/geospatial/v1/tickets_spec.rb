# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Geospatial::V1::Tickets, type: :request do
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
      DigsiteInfo: {
        WellKnownText: digsite_info.well_known_text
      },
      Excavator: {
        CompanyName: excavator.company_name,
        Address: excavator.address,
        CrewOnsite: excavator.crew_on_site
      }
    }
  end

  describe 'POST /v1/tickets' do
    subject(:post_request) { post '/api/v1/tickets', params: }

    context 'when the request is valid' do
      it 'creates a new ticket with excavator' do
        post_request
        expect(response).to have_http_status(:created)
        expect(response.body).to include('Ticket and Excavator created successfully.')
        expect(response.body).to include('ticket_id')
      end
    end

    context 'when the request is invalid' do
      let(:params) do
        {
          RequestNumber: nil
        }
      end

      it 'does not create a ticket' do
        post_request
        expect(response).to have_http_status(:bad_request)
        expect(response.body).to include('is missing')
      end
    end
  end
end
