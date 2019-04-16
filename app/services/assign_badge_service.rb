class AssignBadgeService
  METHODS_AND_ICONS = { first_try?: 'First try!' }.freeze
  def initialize(test_passage, current_user)
    @test_passage = test_passage
    @current_user = current_user
  end

  def call
    METHODS_AND_ICONS.each do |method, name|
      @current_user.user_badges.create(badge: Badge.find_by(name: name)) if send method
    end
  end

  private

  def first_try?
    return false if TestPassage.where(test: @test_passage.test).count > 1 || @test_passage.failed?

    true
  end
end
