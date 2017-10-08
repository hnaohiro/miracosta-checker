class NotificationMailer < ApplicationMailer
  def push(job)
    @job = job
    from = "ミラコスタ チェッカー <#{ENV['MAIL_FROM']}>"
    to = ENV['MAIL_TO'].split(',')
    mail from: from, to: to, subject: 'ミラコスタ チェッカー'
  end
end
