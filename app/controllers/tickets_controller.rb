# frozen_string_literal: true

class TicketsController < ApplicationController
  def index
    @pagy, @tickets = pagy(Ticket.includes(:excavator).all, items: 3)
  end

  def show
    @ticket = Ticket.includes(:excavator).find_by(id: params[:id])
    redirect_to tickets_path, alert: 'Ticket not found' unless @ticket
  end
end
