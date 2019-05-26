class Admin::TestsController < Admin::BaseController
  rescue_from ActiveRecord::RecordNotFound, with: :rescue_with_question_not_found

  before_action :set_test, only: %i[start show destroy edit update_inline update]
  before_action :set_tests, onli: %i[index update_inline]

  def index
    @tests = Test.all
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

  def update
    if @test.update(test_params)
      redirect_to admin_tests_path
    else
      render :index
    end
  end

  def update_inline
    if @test.update(test_params)
      redirect_to admin_tests_path
    else
      render :index
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

  def set_tests
    @tests = Test.all
  end

  def set_test
    @test = Test.find(params[:id])
  end

  def test_params
    params.require(:test).permit(:title, :level, :category_id, :passage_time)
  end
end
