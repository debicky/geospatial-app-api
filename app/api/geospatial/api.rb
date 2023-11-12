# frozen_string_literal: true

module Geospatial
  class Api < Grape::API
    helpers Geospatial::Helpers

    version 'v1', using: :path
    format :json
    prefix :api

    mount Geospatial::V1::Tickets

    add_swagger_documentation(
      mount_path: '/swagger_doc',
      api_version: 'v1'
    )
  end
end
