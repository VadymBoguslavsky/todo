class Task < ApplicationRecord
  validates :title, presence: true, length: {minimum: 5, too_short: "%{count} characters is the minimum allowed"}
  validates :priority, presence: true
  belongs_to :user
end
