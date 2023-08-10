class Student < ApplicationRecord
    belongs_to :instructor
    validates :name,:major, presence: true
    validates :age, numericality: {
        greater_than_or_equal_to: 18}
end
# - name (must be present)
#   - major
#   - age (must be >= 18)
