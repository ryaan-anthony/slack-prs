require 'slack-stash/daemon'

desc 'Run the daemon'
task :run do
 loop { SlackStash::Daemon.perform }
end