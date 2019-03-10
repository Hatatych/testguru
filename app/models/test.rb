class Test < ApplicationRecord
  belongs_to :category

  def self.find_by_category(title)
    joins(:category).where(categories: { title: title })
  end
end
