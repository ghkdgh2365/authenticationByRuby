class ApplicationMailer < ActionMailer::Base
  default from: 'welcome@myworld.com'
  layout 'mailer'
end