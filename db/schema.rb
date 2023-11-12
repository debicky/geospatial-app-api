# frozen_string_literal: true

# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.1].define(version: 2023_11_12_081041) do
  # These are extensions that must be enabled in order to support this database
  enable_extension 'plpgsql'
  enable_extension 'postgis'

  create_table 'additional_service_area_codes', force: :cascade do |t|
    t.bigint 'service_area_id', null: false
    t.string 'sa_code', default: [], array: true
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.index ['service_area_id'], name: 'index_additional_service_area_codes_on_service_area_id'
  end

  create_table 'digsite_infos', force: :cascade do |t|
    t.bigint 'ticket_id', null: false
    t.geography 'well_known_text', limit: { srid: 4326, type: 'st_polygon', geographic: true }
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.index ['ticket_id'], name: 'index_digsite_infos_on_ticket_id'
  end

  create_table 'excavators', force: :cascade do |t|
    t.bigint 'ticket_id', null: false
    t.string 'company_name'
    t.string 'address'
    t.boolean 'crew_on_site'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.index ['ticket_id'], name: 'index_excavators_on_ticket_id'
  end

  create_table 'primary_service_area_codes', force: :cascade do |t|
    t.bigint 'service_area_id', null: false
    t.string 'sa_code'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.index ['service_area_id'], name: 'index_primary_service_area_codes_on_service_area_id'
  end

  create_table 'service_areas', force: :cascade do |t|
    t.bigint 'ticket_id', null: false
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.index ['ticket_id'], name: 'index_service_areas_on_ticket_id'
  end

  create_table 'ticket_date_times', force: :cascade do |t|
    t.bigint 'ticket_id', null: false
    t.datetime 'response_due_date_time'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.index ['ticket_id'], name: 'index_ticket_date_times_on_ticket_id'
  end

  create_table 'tickets', force: :cascade do |t|
    t.string 'request_number'
    t.integer 'sequence_number'
    t.string 'request_type'
    t.string 'request_action'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
  end

  add_foreign_key 'additional_service_area_codes', 'service_areas'
  add_foreign_key 'digsite_infos', 'tickets'
  add_foreign_key 'excavators', 'tickets'
  add_foreign_key 'primary_service_area_codes', 'service_areas'
  add_foreign_key 'service_areas', 'tickets'
  add_foreign_key 'ticket_date_times', 'tickets'
end
