# frozen_string_literal: true

Rails.application.routes.draw do
  resources :tickets, only: %i[index show]
  mount GrapeSwaggerRails::Engine => '/api/docs'
  mount Geospatial::Api => '/'
end
