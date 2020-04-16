class Subscription < ApplicationRecord
  extend FriendlyId

  friendly_id :uuid, use: %i[slugged finders]

  belongs_to :publication
  has_and_belongs_to_many :user

  validates :title, presence: true
  validates_uniqueness_of :user_id
end
