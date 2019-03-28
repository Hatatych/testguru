module QuestionsHelper
  def question_header
    case params[:action]
    when 'new' then "<h1>Create new #{@test.title} question</h1>".html_safe
    when 'edit' then "<h1>Edit #{@question.test.title} question</h1>".html_safe
    else "<h1>Undefined action</h1>".html_safe
    end
  end
end
