
every 1.minute do # Use any day of the week or :weekend, :weekday
  runner "Group.daily_reminder"
end