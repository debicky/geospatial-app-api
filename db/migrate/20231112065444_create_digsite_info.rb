# frozen_string_literal: true

class CreateDigsiteInfo < ActiveRecord::Migration[7.1]
  def change
    create_table :digsite_infos do |t|
      t.references :ticket, null: false, foreign_key: true
      t.st_polygon :well_known_text, geographic: true

      t.timestamps
    end
  end
end
