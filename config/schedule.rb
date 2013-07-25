
every 1.hour do # Use any day of the week or :weekend, :weekday
  runner "Group.daily_reminder"
end

every 1.minute do
	runner "DailyLog.receive_email"
end