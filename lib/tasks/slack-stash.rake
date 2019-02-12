require 'slack-stash'

desc 'Run the console'
task :console do
 binding.pry
end

desc 'Generate report'
task :report do
 Rake::Task[:refresh].execute
 Rake::Task[:pending_review].execute
 Rake::Task[:approved].execute
end

desc 'Refresh the pull requests'
task :refresh do
 SlackStash::RefreshPullRequests.new.perform
end

desc 'Pull requests that need reviews'
task :pending_review do
 puts :pending_review
 SlackStash::Repo.each do |repo|
  repo.pull_requests.pending_review.each { |pr| render pr }
 end
end

desc 'Pull requests that are approved'
task :approved do
 puts :approved
 SlackStash::Repo.each do |repo|
  repo.pull_requests.approved.each { |pr| render pr }
 end
end

desc 'List all repos'
task :repos do
 SlackStash::Repo.each do |repo|
  puts repo.name
 end
end

def render(pull_request)
 days = ((DateTime.now.utc - pull_request.updated_date.utc)/60/60/24).to_i
 #puts "<#{pr.link}|#{URI::encode(pr.title)}> author: #{pr.author.name} #{days > 0 ? "(#{days} days old)" : nil}"
 puts "#{pull_request.link} #{days > 0 ? "(#{days} days old)" : nil} #{pull_request.conflict? ? '[CONFLICT]' : nil}"
end

desc 'Add a repo'
task :add, [:project, :name] do |task, args|
 SlackStash::Repo.find_or_create_by!(args.to_h)
 puts 'Done!'
end

desc 'Setup repos'
task :setup do
 projects = SlackStash::Config.new('stash-projects.yml', 'projects')
 projects.data.each do |project, repos|
  repos.each do |repo|
   puts "Adding #{project}/#{repo}..."
   SlackStash::Repo.find_or_create_by!(project: project, name: repo)
  end
 end
 puts 'Done!'
end