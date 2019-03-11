class User < ApplicationRecord
  has_many :user_tests

  def find_tests_by_level(level)
    Test.joins(:user_tests).where(level: level, user_tests: { user_id: id })
  end
end
