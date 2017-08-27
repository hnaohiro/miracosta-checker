class NotificationMailer < ApplicationMailer
  def push(job)
    @job = job
    from = "ミラコスタ チェッカー <#{ENV['MAIL_FROM'] || 'test@test.com'}>"
    to = (ENV['MAIL_TO'] || 'test@test.com').split(',')
    mail from: from, to: to, subject: 'ミラコスタ チェッカー'
  end
end
