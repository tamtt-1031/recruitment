class ContactMailer < ApplicationMailer
  default from: 'from@j-vconnection.com'
  layout 'mailer'

  def contact_email
    admin_mails = Admin.all.map(&:email).join(",")

    mail to: admin_mails, subject: "Ứng viên đăng ký"
  end
end
