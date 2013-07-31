class DailyLog < ActiveRecord::Base
	attr_accessible :subject, :content
  belongs_to :member

  Mailman::Rails.receive do
  	default do
  		TaskMailer.receive(message)
  		puts message.inspect
  	end
  end
end