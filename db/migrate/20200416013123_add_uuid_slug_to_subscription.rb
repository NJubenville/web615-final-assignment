# frozen_string_literal: true

class AddUuidSlugToSubscription < ActiveRecord::Migration[5.2]
  def change
    add_column :subscriptions, :uuid, :string, unique: true, index: true
    add_column :subscriptions, :slug, :string, unique: true, index: true

    Subscription.all.each do |subscription|
      uuid = SecureRandom.uuid
      subscription.update_column(:uuid, uuid)
      subscription.update_column(:slug, uuid)
    end
  end
end
