# frozen_string_literal: true

class CreateServiceAreas < ActiveRecord::Migration[7.1]
  def change
    create_table :service_areas do |t|
      t.references :ticket, null: false, foreign_key: true

      t.timestamps
    end
  end
end
