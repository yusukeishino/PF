class InquiryMailer < ApplicationMailer
  def send_mail(inquiry)
    @inquiry = inquiry
    mail(
      from: 'system@example.com',
      to: ENV['GMAIL_ADDRESS'],
      subject: 'お問い合わせ通知'
    )
  end
end
