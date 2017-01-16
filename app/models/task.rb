class Task < ApplicationRecord
PRIORITIES = [
['Later', 1],
['Next', 2],
['Now', 3]
]



validates :title, presence: true, length: {minimum: 5, too_short: "%{count} characters is the minimum allowed"}

def complete!
self.completed = true
save
end
end
