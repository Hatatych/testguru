module QuestionsHelper
  def question_header(question)
    return "<h1>#{t('admin.questions.header.new', title: @test.title)}</h1>".html_safe if question.new_record?
    "<h1>#{t('admin.questions.header.edit', title: @question.test.title)}</h1></h1>".html_safe
  end
end
