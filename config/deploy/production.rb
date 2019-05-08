set :deploy_to, "/sites/capistrano_example"

server '10.0.3.15', user: 'root', roles: %w{web app db}
