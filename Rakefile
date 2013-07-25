#!/usr/bin/env rake
# Add your own tasks in files placed in lib/tasks ending in .rake,
# for example lib/tasks/capistrano.rake, and they will automatically be available to Rake.

require File.expand_path('../config/application', __FILE__)

DigestTeamMailer::Application.load_tasks


# namespace :mailman do

#   mailman_tasks = [:start, :status]

#   mailman_tasks.each do |task_name|

#     # Generate description
#     if task_name == :status
#       desc "Check the status of the Mailman service"
#     else
#       desc "#{task_name.to_s.camelize} the Mailman service"
#     end

#     task task_name do
#       Daemons.run_proc("script/mailman_daemon.rb", :ARGV => [task_name.to_s]) do
#         Rake::Task["mailman"].invoke
#       end
#     end

#   end

# end


# desc "Mailman service in the foreground"
# task :mailman => :environment do

#   Mailman.config.logger = Logger.new("#{Rails.root}/log/mailman.#{Rails.env}.log")

#   Mailman::Rails.run!
# end