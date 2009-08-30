set :application, "markdownr.com"

role :app, "#{application}"
role :web, "#{application}"
role :db, "#{application}", :primary => true

set :deploy_to, "/var/www/#{application}"

set :user, "samsoffes"
set :deploy_via, :remote_cache
set :use_sudo, false

# Git
set :scm, "git"
set :repository,  "git@github.com:samsoffes/#{application}.git"
set :branch, "master"
set :git_shallow_clone, 1
set :git_enable_submodules, 1

# Tasks
namespace :deploy do
  
  # Restart Passenger
  task :restart do
    run "touch #{current_path}/tmp/restart.txt"
  end
  
  # Nuke All
  desc "Nuke entire deploy_to directory"
  task :nuke_all do
    run "rm -rf #{deploy_to}/*"
  end
end
