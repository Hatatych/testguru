class Admin::TestsController < Admin::BaseController
  rescue_from ActiveRecord::RecordNotFound, with: :rescue_with_question_not_found

  before_action :set_test, only: %i[start show destroy edit]

  def index
    @tests = Test.all
  end

  # View all tests and one test with questions
  def start
    current_user.tests.push(@test)
    redirect_to current_user.test_passage(@test)
  end

  def show
    @questions = @test.questions
  end

  # New test - DONE
  def new
    @test = Test.new
  end

  def create
    @test = current_user.created_tests.new(test_params)

    if @test.save
      redirect_to admin_root_path
    else
      render :new
    end
  end

  # Edit existing test - DONE
  def edit; end

  # Deleting test - DONE
  def destroy
    @test.destroy
    redirect_to admin_root_path
  end

  private

  def set_test
    @test = Test.find(params[:id])
  end

  def test_params
    params.require(:test).permit(:title, :category_id, :author_id)
  end
end
