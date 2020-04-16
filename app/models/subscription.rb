class Subscription < ApplicationRecord
  extend FriendlyId

  friendly_id :uuid, use: %i[slugged finders]

  belongs_to :publication
  has_and_belongs_to_many :users

  validates :title, presence: true

end
