# frozen_string_literal: true

class CreatePrimaryServiceAreaCodes < ActiveRecord::Migration[7.1]
  def change
    create_table :primary_service_area_codes do |t|
      t.references :service_area, null: false, foreign_key: true
      t.string :sa_code

      t.timestamps
    end
  end
end
