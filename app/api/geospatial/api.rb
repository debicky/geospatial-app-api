module Geospatial
  class Api < Grape::API
    mount Geospatial::V1::Tickets
  
    version 'v1', using: :path
    format :json
    prefix :api
  end
end