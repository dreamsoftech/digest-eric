class TaskMailer < ActionMailer::Base
    default from: "notifications@example.com"

    def request_submit_email(member)
        @member = member
        mail(to: member.email, subject: "Please submit your work")
    end

    def weekly_log_email(member, group)
        @member = member
        @group = group

        time_range = Time.now.beginning_of_week..(Time.now.beginning_of_week + 5.days)
        @daily_logs = member.daily_logs.where(daily_logs: {created_at: time_range})

        mail(to: member.email, subject: "Your Week Log")
    end

    def resend(email)
       mail(to: email.from.first, subject: "Thanks", body: "Thanks for your response").deliver
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