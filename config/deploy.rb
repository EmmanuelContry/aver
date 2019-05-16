# config valid only for Capistrano 3.1

lock '3.11.0'

set :stages, ["production"]
set :default_stage, "production"
set :ssh_options, {:forward_agent => true}

set :application, 'capistrano_example'
set :repo_url, 'https://EmmanuelContry:a076f919899eb5d05ff4855a3aecf0eb43f603bf@github.com/EmmanuelContry/aver.git'
set :user, "EmmanuelContry"

#set :linked_dirs, %w(my_shared_directory)

namespace :deploy do


    desc 'Print The Server Name'
    task :path do
    on roles :app do
        puts "Release path: #{release_path}"
        puts "Current path: #{current_path}"
        execute "ln -s /home/memenuel/1 #{release_path}/index.html"
    end
    #task :print_server_name do
     # on roles(:app), in: :groups, limit:1 do
      #  execute "hostname"
      #end
    #end

end

after "deploy:updated", "deploy:print_server_name"
