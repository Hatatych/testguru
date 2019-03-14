class Test < ApplicationRecord
  belongs_to :category
  has_many :tests_users
  has_many :users, through: :tests_users
  has_many :questions
  belongs_to :author, class_name: 'User'

  def self.find_by_category(title)
    select(:title).joins(:category).where(categories: { title: title }).order(title: :desc)
  end
end
