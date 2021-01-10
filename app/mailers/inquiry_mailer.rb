class InquiryMailer < ApplicationMailer

  def send_mail(inquiry)
    @inquiry = inquiry
    mail(
      from: 'system@example.com',
      to:   'yskgori0407@gmail.com',
      subject: 'お問い合わせ通知'
    )
  end


end
