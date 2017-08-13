class InformMailer < ActionMailer::Base
  default from: "notify.me.myself.and.i@gmail.com"

  def notify(notification)
    self.instance_variable_set(:@lookup_context, nil)
    @notification = notification
    mail(:to => notification.mail, :subject => notification.subject)
  end
end