class QuestionsController < ApplicationController
  before_action :find_test

  rescue_from ActiveRecord::RecordNotFound, with: :rescue_with_question_not_found
  # как мне обрабатывать исключения ТОЛЬКО для вопросов?
  # тк сейчас он ругается ответом про Question даже если не найден тест в роуте /tests/20

  def index
    render inline: 'Questions: <%= @test.questions.inspect %>'
  end

  def show
    render inline: 'Question: <%= Question.find(request.params[:id]).inspect %> <br/><br/> Answers: <%= Question.find(request.params[:id]).answers.inspect %>'
  end

  def new; end

  def create
    question = Question.create!(question_params)

    render plain: question.inspect
  end

  def destroy
    Question.find(request.params[:test_id]).destroy
    render plain: 'Deleted'
  end

  private

  def question_params
    params.require(:question).permit(:body, :test_id)
  end

  def find_test
    @test = Test.find(request.params[:test_id])
  end

  def rescue_with_question_not_found
    render plain: 'Question not found!'
  end
end
