class Task < ApplicationRecord
  validates :title, presence: true, length: {minimum: 5, too_short: "%{count} characters is the minimum allowed"}
  belongs_to :user
end
