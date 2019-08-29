class ApplicationMailer < ActionMailer::Base
  default from: %("No Reply" <hatatestguru@yandex.ru>)
  layout 'mailer'
end
