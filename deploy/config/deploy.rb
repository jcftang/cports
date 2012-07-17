set :application, "cports"
set :domain, (ENV['name'] || 'cports_test')
set :deploy_to, "/tmp/build-#{application}"

default_run_options[:pty] = true
ssh_options[:forward_agent] = true
set :user, 'vagrant'

set :scm, :git
set :repository, "https://github.com/jcftang/cports.git"
set :branch, "master"
set :deploy_via, :remote_cache
set :group_writable, true
set :use_sudo, false

#require 'capistrano/ext/multistage'
#require "rvm/capistrano"
require 'bundler/capistrano'

role :app, domain, :primary => true

namespace :deploy do
  task :default do
    deploy.configure
    deploy.bootstrap1
    deploy.bootstrap2
  end

  desc "Configure an installation of cports"
  task :configure do
    run "git clone #{shared_path}/cached-copy/ #{release_path}" 
    run "cd #{release_path}; ./configure.sh --prefix=$(pwd)"
  end

  desc "Bootstrap stage 1"
  task :bootstrap1 do
    run "echo Run boostrap 1"
  end

  desc "Bootstrap stage 2"
  task :bootstrap2 do
    run "echo Run boostrap 2"
  end 

end

after "deploy:configure", "deploy:bootstrap1"
after "deploy:bootstrap1", "deploy:bootstrap2"
