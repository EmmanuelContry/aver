# config valid only for Capistrano 3.1
 require 'capistrano/scm/git'
lock '3.11.0'

set :stages, ["production"]
set :default_stage, "production"
set :ssh_options, {:forward_agent => true}

set :application, 'capistrano_example'
set :repo_url, 'git@github.com:EmmanuelContry/aver.git'
set :user, "davzie"

#set :linked_dirs, %w(my_shared_directory)

namespace :deploy do


    desc 'Print The Server Name'
    task :print_server_name do
      on roles(:app), in: :groups, limit:1 do
        execute "hostname"
      end
    end

end

after "deploy:updated", "deploy:print_server_name"
