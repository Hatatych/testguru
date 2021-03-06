class Test < ApplicationRecord
  belongs_to :category
  has_many :test_passages, dependent: :destroy
  has_many :users, through: :test_passages
  has_many :questions, dependent: :destroy
  belongs_to :author, class_name: 'User', required: false

  validates :title, presence: true
  validates_numericality_of :level, only_integer: true, greater_than_or_equal_to: 0
  validates :title, uniqueness: { scope: :level }

  scope :find_by_difficulty, ->(level) { where(level: determine_difficulty(level)) }
  scope :find_by_category, ->(title) { joins(:category).where(categories: { title: title }) }

  class << self
    def by_category(category)
      find_by_category(category).order(title: :desc).pluck(:title)
    end

    private

    def determine_difficulty(level)
      return (0..1) if (0..1).cover?(level)
      return (2..4) if (2..4).cover?(level)
      return (5..Float::INFINITY) if (5..Float::INFINITY).cover?(level)

      nil
    end
  end

  def empty?
    return true if questions.count == 0

    false
  end
end
