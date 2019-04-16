class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable,
         :confirmable,
         :registerable,
         :recoverable,
         :rememberable,
         :validatable

  has_many :test_passages, dependent: :destroy
  has_many :tests, through: :test_passages

  has_many :created_tests, class_name: 'Test', foreign_key: :author_id, dependent: :nullify
  has_many :gists, dependent: :nullify

  has_many :user_badges, dependent: :destroy
  has_many :badges, through: :user_badges

  validates :email, presence: true
  validates :email, uniqueness: true
  validates :email, format: { with: /\w*@\w*\.\w*/, message: 'Must contain at and dot' }

  def find_tests_by_level(level)
    Test.joins(:user_tests).where(level: level, user_tests: { user_id: id })
  end

  def test_passage(test)
    test_passages.order(id: :desc).find_by(test_id: test.id)
  end

  def admin?
    is_a?(Admin)
  end
end
