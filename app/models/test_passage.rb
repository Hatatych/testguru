class TestPassage < ApplicationRecord
  PASSAGE_BORDER = 85

  belongs_to :user
  belongs_to :test
  belongs_to :current_question, class_name: 'Question', optional: true

  before_validation :before_validation_set_first_question, on: :create
  after_commit :after_commit_set_next_question, on: :update

  def accept!(answer_ids)
    self.correct_questions += 1 if correct_answer?(answer_ids)
    save!
  end

  def completed?
    current_question.nil?
  end

  def success?
    return true if score >= PASSAGE_BORDER

    false
  end

  def current_question_position(question)
    test.questions.find_index(question) + 1
  end

  def progress_percentage
    current_position = current_question_position(current_question) - 1
    total_questions = test.questions.count

    (current_position.to_f / total_questions * 100).to_i
  end

  def score
    (self.correct_questions.to_f / test.questions.count * 100).to_i
  end

  private

  def before_validation_set_first_question
    self.current_question = test.questions.first if test.present?
  end

  def correct_answer?(answer_ids)
    correct_answers.ids.sort == answer_ids.map(&:to_i).sort
  end

  def correct_answers
    current_question.answers.correct
  end

  def next_question
    test.questions.order(:id).where('id > ?', current_question.id).first
  end

  def after_commit_set_next_question
    self.current_question = next_question
  end
end
