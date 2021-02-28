class InquirysController < ApplicationController
  def new
    @inquiry = Inquiry.new
  end

  def create
    @inquiry = Inquiry.new(inquiry_params)
    if @inquiry.save
      InquiryMailer.send_mail(@inquiry).deliver
      redirect_to confirm_path
    else
      render :new
    end
  end

  def confirm; end

  private

  def inquiry_params
    params.require(:inquiry).permit(:name, :address, :message)
  end
end
