class DailyLog < ActiveRecord::Base
	attr_accessible :subject, :content
  belongs_to :member

  Mailman::Rails.receive do
  	logger.debug "--------------------------------------------------"
  	logger.debug message.from.first
  end
end