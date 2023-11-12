# frozen_string_literal: true

RSpec.describe TicketsController, type: :controller do
  describe 'GET #index' do
    subject(:index_action) { get :index }

    it 'responds with success' do
      index_action
      expect(response).to have_http_status(:success)
    end
  end

  describe 'GET #show' do
    let!(:ticket) { create(:ticket) }

    context 'when the ticket exists' do
      subject(:show_action) { get :show, params: { id: ticket.id } }

      it 'responds with success' do
        show_action
        expect(response).to have_http_status(:success)
      end
    end

    context 'when the ticket does not exist' do
      subject(:show_action) { get :show, params: { id: -1 } }

      it 'redirects to the index page' do
        show_action
        expect(response).to redirect_to(tickets_path)
        expect(flash[:alert]).to match(/Ticket not found/)
      end
    end
  end
end
