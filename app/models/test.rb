class Test < ApplicationRecord
  belongs_to :category
  has_many :user_tests

  def self.find_by_category(title)
    select(:title).joins(:category).where(categories: { title: title }).order(title: :desc)
  end
end
