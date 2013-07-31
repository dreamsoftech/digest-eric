class DailyLog < ActiveRecord::Base
	attr_accessible :subject, :content
  belongs_to :member

  Mailman::Rails.receive do
  	TaskMailer.resend(message)
  end
end