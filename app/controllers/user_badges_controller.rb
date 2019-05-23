class UserBadgesController < ApplicationController
  def index
    @user_badges = UserBadge.where(user: current_user)
    @badges = Badge.all
  end
end
