require 'slack-stash'

desc 'Run the application'
task :run do
 loop { SlackStash::App.run }
end