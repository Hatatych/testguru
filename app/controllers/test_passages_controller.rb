class TestPassagesController < ApplicationController

  before_action :authenticate_user!
  before_action :set_test_passage, on: %i[show result update gist]

  def show
  end

  def result
  end

  def gist
    result = GistQuestionService.new(@test_passage.current_question).call

    flash_options = if result.url.present?
      { notice: t('.success', url: "<a href=\"https://gist.github.com/Hatatych/#{result.id}\">#{t('general.here_link')}</a>") }
    else
      { alert: t('.failure') }
    end

    gist = Gist.new(user: current_user, question: @test_passage.current_question, url: result.url)
    flash[:alert] = 'Error has occured while saving Gist info into DB!' unless gist.save

    redirect_to @test_passage, flash_options
  end

  def update
    @test_passage.accept!(params[:answer_ids])
    if @test_passage.completed?
      TestsMailer.completed_test(@test_passage).deliver_now
      redirect_to result_test_passage_path(@test_passage)
    else
      render :show
    end
  end

  private

  def set_test_passage
    @test_passage = TestPassage.find(params[:id])
  end
end
