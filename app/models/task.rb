class Task < ApplicationRecord
  validates :title, presence: true, length: {minimum: 5, too_short: "%{count} characters is the minimum allowed"}
  validates :priority, presence: true, numericality: { only_integer: true }
  belongs_to :user

  scoped_search on: [:title, :priority]
  scope :active, -> { where(completed: false) }
  scope :inactive, -> { where(completed: true) }
end
