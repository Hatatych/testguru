class Admin::BadgesController < Admin::BaseController
  before_action :find_badge, only: %i[update destroy]

  def index
    @badges = Badge.all
  end

  def new
    @badge = Badge.new
  end

  def create
    @badge = Badge.new(badge_params)

    if @badge.save
      redirect_to admin_badges_path
    else
      render :new
    end
  end

  def update
    if @badge.update(badge_params)
      redirect_to admin_badges_path
    else
      render :edit
    end
  end

  def edit
    @badge = Badge.find(params[:id])
  end

  def destroy
    @badge.destroy
    redirect_to admin_badges_path
  end

  private

  def badge_params
    params.require(:badge).permit(:logo, :name, :method)
  end

  def find_badge
    @badge = Badge.find(params[:id])
  end
end
