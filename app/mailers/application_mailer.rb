class ApplicationMailer < ActionMailer::Base
  default to: "info@mylibrary.com", from: 'from@mylibrary.com'
  layout 'mailer'
end
