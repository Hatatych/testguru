class AssignBadgeService
  METHODS_AND_ICONS = { first_try?: 'First try!' }.freeze
  def initialize(test_passage, current_user)
    @test_passage = test_passage
    @current_user = current_user
  end

  def call
    Badge.each do |badge|
      @current_user.user_badges.create(badge: badge) if send badge.method.to_sym
    end
  end

  private

  def first_try?
    return false if current_user.test_passages.where(test: @test_passage.test).count > 1 || @test_passage.failed?

    true
  end

  def all_backends?
    return false if Test.where(category: Category.where(title: 'Backend')).where.not(id: u.test_passages.select(:test_id)).exists?

    true
  end

  def all_level?
    return false if Test.where(level: 0).where.not(id: current_user.test_passages.select(:test_id)).exists?

    true
  end
end
