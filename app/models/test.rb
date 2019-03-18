class Test < ApplicationRecord
  belongs_to :category
  has_many :tests_users
  has_many :users, through: :tests_users
  has_many :questions
  belongs_to :author, class_name: 'User'

  validates :title, presence: true
  validates_numericality_of :level, only_integer: true, greater_than_or_equal_to: 0
  validates :title, uniqueness: { scope: :level }

  difficulties = { easy: (0..1), advanced: (2..4), hard: (5..Float::INFINITY) }

  scope :find_by_difficulty, ->(level) { where(level: difficulties[determine_difficulty(level)]) }
  scope :find_by_category, ->(title) { joins(:category).where(categories: { title: title }).order(title: :desc) }

  class << self
    def by_category(category)
      find_by_category(category).pluck(:title)
    end

    private

    def determine_difficulty(level)
      return :easy if (0..1).cover?(level)
      return :advanced if (2..4).cover?(level)
      return :hard if (5..Float::INFINITY).cover?(level)

      nil
    end
  end
end
