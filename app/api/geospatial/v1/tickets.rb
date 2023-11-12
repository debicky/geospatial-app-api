# frozen_string_literal: true

module Geospatial
  module V1
    class Tickets < Grape::API
      helpers Geospatial::Helpers

      resource :tickets do
        desc 'Create a Ticket with Excavator', failure: [{ code: 422, message: 'Unprocessable entity' }]

        params do
          requires :RequestNumber, type: String
          requires :SequenceNumber, type: String
          requires :RequestType, type: String
          requires :RequestAction, type: String

          requires :DateTimes, type: Hash do
            requires :ResponseDueDateTime, type: DateTime
          end

          requires :ServiceArea, type: Hash do
            requires :PrimaryServiceAreaCode, type: Hash do
              requires :SACode, type: String
            end
            requires :AdditionalServiceAreaCodes, type: Hash do
              requires :SACode, type: Array[String]
            end
          end

          requires :ExcavationInfo, type: Hash do
            requires :DigsiteInfo, type: Hash do
              requires :WellKnownText, type: String
            end
          end

          requires :Excavator, type: Hash do
            requires :CompanyName, type: String
            requires :Address, type: String
            optional :CrewOnsite, type: Boolean, default: false
          end
        end

        post do
          service_call = ::Tickets::Create.call(declared_params)

          if service_call[:error]
            error!({ message: service_call[:error] }, 422)
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
