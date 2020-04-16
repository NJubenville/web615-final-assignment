class ManyToManyRelationship < ActiveRecord::Migration[5.2]
  def change
    create_table :subscription_users, id: false do |t|
      t.belongs_to :subscription
      t.belongs_to :user
    end
  end
end
