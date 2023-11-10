require 'rails_helper'

describe Geospatial::V1::Tickets, type: :request do
  let(:valid_params) do
    {
      request_number: "09252012-00001",
      sequence_number: "2421",
      request_type: "Normal",
      request_action: "Restake",
      response_due_date_time: "2011-07-13T23:59:59",
      primary_service_area_code: "ZZGL103",
      additional_service_area_codes: ["ZZL01", "ZZL02", "ZZL03"],
      well_known_text: "POLYGON((-81.13390268058475 32.07206917625161,...))",
      excavator: {
        company_name: "John Doe CONSTRUCTION",
        address: "555 Some RD, SOME PARK, ZZ 55555",
        crew_on_site: true
      }
    }
  end

  let(:invalid_params) do
    {
      request_number: nil,
    }
  end

  describe 'POST /v1/tickets' do
    subject(:post_request) { post '/api/v1/tickets', params: params }

    context 'when the request is valid' do
      let(:params) { valid_params }

      it 'creates a new ticket with excavator' do
        post_request
        expect(response).to have_http_status(:created)
        expect(response.body).to include('Ticket and Excavator created successfully.')
        expect(response.body).to include('ticket_id')
      end
    end

    context 'when the request is invalid' do
      let(:params) { invalid_params }

      it 'does not create a ticket' do
        post_request
        expect(response).to have_http_status(:bad_request)
        expect(response.body).to include('is missing')
      end
    end
  end
end
