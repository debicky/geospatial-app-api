# frozen_string_literal: true

class CreateDateTimes < ActiveRecord::Migration[7.1]
  def change
    create_table :date_times do |t|
      t.references :ticket, null: false, foreign_key: true
      t.datetime :response_due_date_time

      t.timestamps
    end
  end
end
