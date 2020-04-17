# frozen_string_literal: true

class SubscriptionPolicy < ApplicationPolicy
  def create?
    true
  end

  def new?
    true
  end

  def update?
    true
  end
end
