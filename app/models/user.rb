class User < ApplicationRecord
  def find_tests_by_level(level)
    UserTest.joins(:test).where(user_id: @id, tests: { level: level })
  end
end
