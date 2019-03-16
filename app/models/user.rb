class User < ApplicationRecord
  has_many :tests_users
  has_many :tests, through: :tests_users
  has_many :created_tests, class_name: 'Test', foreign_key: :author_id

  def find_tests_by_level(level)
    Test.joins(:user_tests).where(level: level, user_tests: { user_id: id })
  end
end
