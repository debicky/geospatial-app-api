# frozen_string_literal: true

module Geospatial
  class Api < Grape::API
    helpers Geospatial::Helpers

    mount Geospatial::V1::Tickets
    
    version 'v1', using: :path
    format :json
    prefix :api
  end
end
