require 'slack-stash'

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
