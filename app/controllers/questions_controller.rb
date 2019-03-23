class QuestionsController < ApplicationController
  before_action :find_test

  rescue_from ActiveRecord::RecordNotFound, with: :rescue_with_question_not_found

  def index
    render inline: 'Questions: <%= @test.questions.inspect %>'
  end

  def show
    render inline: 'Question: <%= Question.find(params[:id]).inspect %> <br/><br/> Answers: <%= Question.find(params[:id]).answers.inspect %>'
  end

  def new; end

  def create
    question = Test.find(params[:test_id]).questions.create!(question_params)

    render plain: question.inspect
  end

  def destroy
    Question.find(params[:test_id]).destroy
    render plain: 'Deleted'
  end

  private

  def question_params
    params.require(:question).permit(:body)
  end

  def find_test
    @test = Test.find(params[:test_id])
  end

  def rescue_with_question_not_found
    render plain: 'Question not found!'
  end
end
