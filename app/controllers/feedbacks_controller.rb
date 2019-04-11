class FeedbacksController < ApplicationController
  before_action :authenticate_user!

  def new; end

  def send_mail
    FeedbackMailer.send_mail(params[:text]).deliver_now
    flash[:notice] = 'Спасибо за обратную связь!'
    redirect_to root_path
  end
end
