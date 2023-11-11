# frozen_string_literal: true

require 'rails_helper'

describe Geospatial::V1::Tickets, type: :request do
  let(:ticket_attributes) { attributes_for(:ticket) }
  let(:excavator_attributes) { attributes_for(:excavator) }
  let(:params) { ticket_attributes.merge(excavator: excavator_attributes) }

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
          request_number: nil
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
