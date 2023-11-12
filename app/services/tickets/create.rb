# frozen_string_literal: true

module Tickets
  class Create < BaseService
    def initialize(params)
      @params = params
    end

    def call
      Ticket.transaction do
        ticket = create_ticket
        create_related_entities_for(ticket)
        { status: :created, message: 'Ticket and Excavator created successfully.', ticket_id: ticket.id }
      end
    rescue ActiveRecord::RecordInvalid => e
      { status: :unprocessable_entity, error: e.message }
    end

    private

    def create_ticket
      Ticket.create!(extract_ticket_attributes)
    end

    def create_related_entities_for(ticket)
      ticket.create_excavator!(extract_excavator_attributes)
      ticket.create_digsite_info!(extract_digsite_info_attributes)
      ticket.create_ticket_date_time!(extract_date_time_attributes)
      create_service_area_and_codes(ticket)
    end

    def extract_ticket_attributes
      {
        request_number: @params[:RequestNumber],
        sequence_number: @params[:SequenceNumber],
        request_type: @params[:RequestType],
        request_action: @params[:RequestAction]
      }
    end

    def extract_excavator_attributes
      excavator_params = @params[:Excavator]
      {
        company_name: excavator_params[:CompanyName],
        address: excavator_params[:Address],
        crew_on_site: excavator_params[:CrewOnsite] == 'true'
      }
    end

    def extract_digsite_info_attributes
      { well_known_text: @params[:ExcavationInfo][:DigsiteInfo][:WellKnownText] }
    end

    def extract_date_time_attributes
      { response_due_date_time: @params[:DateTimes][:ResponseDueDateTime] }
    end

    def create_service_area_and_codes(ticket)
      service_area = ticket.create_service_area!
      extract_primary_service_area_code(service_area)
      extract_additional_service_area_codes(service_area)
    end

    def extract_primary_service_area_code(service_area)
      sa_code = @params[:ServiceArea][:PrimaryServiceAreaCode][:SACode]
      service_area.create_primary_service_area_code!(sa_code:)
    end

    def extract_additional_service_area_codes(service_area)
      sa_codes = @params[:ServiceArea][:AdditionalServiceAreaCodes][:SACode]
      service_area.create_additional_service_area_code!(sa_code: sa_codes)
    end
  end
end
