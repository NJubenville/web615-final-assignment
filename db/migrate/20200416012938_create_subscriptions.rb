# frozen_string_literal: true

class CreateSubscriptions < ActiveRecord::Migration[5.2]
  def change
    create_table :subscriptions do |t|
      t.string :title
      t.integer :publication_id

      t.timestamps
    end
  end
end
