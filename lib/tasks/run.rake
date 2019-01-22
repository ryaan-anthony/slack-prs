require 'slack-stash'

desc 'Run the application'
task :run do
 loop { SlackStash::App.run; sleep 60 }
end

desc 'Run the console'
task :console do
 binding.pry
end