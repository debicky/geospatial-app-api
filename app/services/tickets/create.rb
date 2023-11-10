# frozen_string_literal: true

module Tickets
  class Create < BaseService
    def initialize(params)
      @ticket_attributes = params.except(:excavator)
      @excavator_attributes = params[:excavator]
    end

    def call
      ticket = create_ticket_and_excavator

      { status: :created, message: 'Ticket and Excavator created successfully.', ticket_id: ticket.id }
    rescue ActiveRecord::RecordInvalid => e
      { status: :unprocessable_entity, error: e.message }
    end

    private

    attr_reader :ticket_attributes, :excavator_attributes

    def create_ticket_and_excavator
      Ticket.transaction do
        ticket = Ticket.create!(@ticket_attributes)
        ticket.create_excavator!(@excavator_attributes)
        ticket
      end
    end
  end
end
