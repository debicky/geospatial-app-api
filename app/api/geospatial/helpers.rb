# frozen_string_literal: true

module Geospatial
  module Helpers
    extend Grape::API::Helpers

    def declared_params
      @declared_params ||= ActionController::Parameters.new(declared(params, include_missing: false)).permit!
    end
  end
end
