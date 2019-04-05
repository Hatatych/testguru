class Admin::TestsController < Admin::BaseController
  rescue_from ActiveRecord::RecordNotFound, with: :rescue_with_question_not_found

  before_action :set_test, only: %i[start show]

  def index
    @tests = Test.all
  end

  def new
    @test = Test.new
  end

  def create
    @test = Test.new(test_params)

    if @test.save
      redirect_to admin_root_path
    else
      render :new
    end
  end

  def start
    current_user.tests.push(@test)
    redirect_to current_user.test_passage(@test)
  end

  def show
    @questions = @test.questions
  end

  def edit; end

  def destroy
    @test.destroy
    redirect_to admin_root
  end

  private

  def set_test
    @test = Test.find(params[:id])
  end

  def test_params
    params.require(:test).permit(:title, :category, :author)
  end
end
