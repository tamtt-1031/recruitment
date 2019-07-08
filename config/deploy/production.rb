set :stage, :production
set :rails_env, :production
set :deploy_to, "/deploy/apps/recruitment"
set :branch, :master
server "54.250.242.13", user: "deploy", roles: %w(web app db)
