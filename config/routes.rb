# frozen_string_literal: true

Rails.application.routes.draw do
  resources :tickets, only: %i[index show]
  mount GrapeSwaggerRails::Engine => '/api/docs'
  mount Geospatial::V1::Tickets => '/api/v1'
end
