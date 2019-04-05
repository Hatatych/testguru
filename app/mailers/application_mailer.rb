class ApplicationMailer < ActionMailer::Base
  default from: %("Hatatych" <no-reply@hataty.ch>)
  layout 'mailer'
end
