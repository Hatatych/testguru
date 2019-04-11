class FeedbackMailer < ApplicationMailer
  def send_mail(text)
    @text = text
    mail to: 'a.streltsov@revo.ru', subject: "Вам обратная связь!"
  end
end
