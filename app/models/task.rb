class Task < ApplicationRecord
  validates :title, presence: true, length: {minimum: 5, too_short: "%{count} characters is the minimum allowed"}
  validates :priority, presence: true, numericality: { only_integer: true }
  belongs_to :user

  def self.order_by(sort_order)
    if sort_order == "newer" || sort_order.blank?
      order(created_at: :desc)
    elsif sort_order == "title"
      order(title: :asc)
    else
      order(created_at: :asc)
    end
  end

  scoped_search on: [:title, :priority]
  scope :active, -> { where(completed: false) }
  scope :inactive, -> { where(completed: true) }
end