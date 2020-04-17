# frozen_string_literal: true

class ManyToManyRelationship < ActiveRecord::Migration[5.2]
  def change
    create_join_table :subscriptions, :users do |t|
      # t.index :subscription_id
      # t.index :user_id
    end
  end
end
