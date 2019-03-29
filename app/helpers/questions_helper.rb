module QuestionsHelper
  def question_header(question)
    return "<h1>Create new #{@test.title} question</h1>".html_safe if question.new_record?
    "<h1>Edit #{@question.test.title} question</h1>".html_safe
  end
end
