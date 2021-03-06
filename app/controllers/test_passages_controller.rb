class TestPassagesController < ApplicationController

  before_action :authenticate_user!
  before_action :set_test_passage, on: %i[create show result update gist]

  def show
  end

  def result
    AssignBadgeService.new(@test_passage, current_user).call
  end

  def gist
    result = GistQuestionService.new(@test_passage.current_question).call

    if result.url.present?
      current_user.gists.create(question: @test_passage.current_question, url: result.url)
      flash_options = { notice: t('.success', url: "<a href=\"https://gist.github.com/Hatatych/#{result.id}\">#{t('general.here_link')}</a>") }
    else
      flash_options = { alert: t('.failure') }
    end

    redirect_to @test_passage, flash_options
  end

  def update
    if @test_passage.expired?
      flash[:alert] = 'Время, отведенное на тест, истекло!'
      redirect_to result_test_passage_path(@test_passage)
    elsif @test_passage.accept!(params[:answer_ids]).nil?
      flash[:alert] = 'Необходимо выбрать хотя бы 1 ответ'
      render :show
    else
      if @test_passage.completed?
        TestsMailer.completed_test(@test_passage).deliver_now
        redirect_to result_test_passage_path(@test_passage)
      else
        render :show
      end
    end
  end

  private

  def set_test_passage
    @test_passage = TestPassage.find(params[:id])
  end
end
