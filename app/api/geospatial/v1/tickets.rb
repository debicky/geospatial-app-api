# frozen_string_literal: true

module Geospatial
  module V1
    class Tickets < Grape::API
      resource :tickets do
        desc 'Create a Ticket with Excavator', {
          failure: [
            { code: 422, message: 'Unprocessable entity' },
          ]
        }
        params do
          requires :request_number, type: String
          requires :sequence_number, type: String
          requires :request_type, type: String
          requires :request_action, type: String
          requires :response_due_date_time, type: DateTime
          requires :primary_service_area_code, type: String
          requires :additional_service_area_codes, type: Array[String]
          requires :well_known_text, type: String

          requires :excavator, type: Hash do
            requires :company_name, type: String
            requires :address, type: String
            requires :crew_on_site, type: Boolean
          end
        end

        post do
          service_call = ::Tickets::Create.call(declared(params, include_missing: false))

          if service_call[:error]
            error!({ message: result[:error] }, 422)
          else
            status 201
            present :message, 'Ticket and Excavator created successfully.'
            present :ticket_id, service_call[:ticket_id]
          end
        end
      end
    end
  end
end
