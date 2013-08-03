class DailyLog < ActiveRecord::Base
	attr_accessible :subject, :content
  belongs_to :member

  Mailman::Rails.receive do
  	default do
  		return if message.from.empty?
	    
	    member = Member.find_by_email(message.from.first)
	    return if member.nil?

	    if message.multipart?
	        member.daily_logs.create(
	            subject: message.subject,
	            content: message.html_part.body.decoded
	        )
	    else
	        member.daily_logs.create(
	            subject: message.subject,
	            content: message.body.decoded
	        )
	    end  		
  		puts message.inspect
  	end
  	
  end

  def receive(email)
    puts email

    member = Member.find_by_email(email.from.first)
    return if member.nil?

    if email.multipart?
        member.daily_logs.create(
            subject: email.subject,
            content: email.html_part.body.decoded
        )
    else
        member.daily_logs.create(
            subject: email.subject,
            content: email.body.decoded
        )
    end
  end
end