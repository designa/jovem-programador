require 'capistrano_colors'
require 'bundler/capistrano'

#---------------------------------------
# Servidor
#---------------------------------------
set :domain, "jovemprogramador.com"
set :application, "jovemprogramador.com"
set :user, "railsapps"
set :use_sudo, false
set :deploy_to, "/home/#{user}/#{application}"


#---------------------------------------
# Configuração do Repositório
#---------------------------------------
server domain, :app, :web, :db, :primary => true
set :repository,  "git@github.com:designa/jovem-programador.git"
set :scm, :git
set :keep_releases, 5
ssh_options[:forward_agent] = true


#---------------------------------------
# HOOKS
#---------------------------------------
after 'deploy:update_code' do
  deploy.symlink
  
end


#---------------------------------------
# DEPLOY
#---------------------------------------
namespace :deploy do
  task :start do
    run "sudo /etc/init.d/apache2 start"
  end

  task :stop do
    run "sudo /etc/init.d/apache2 stop"
  end

  task :restart, :roles => :app, :except => { :no_release => true } do
    run "#{try_sudo} touch #{File.join(current_path,'tmp','restart.txt')}"
    run "sudo /etc/init.d/apache2 restart"
  end

  task :symlink do
    # create shared folder
    #run "cd #{shared_path}                && mkdir -p folder_name"

    # create symbolic link
    # run "ln -s #{shared_path}/public/photos #{release_path}/public/photos"
  end

  task :seed do
    run "cd #{current_path} && RAILS_ENV=production bundle exec rake db:seed"
  end

  namespace :db do
    task :create do
      run "cd #{current_path} && RAILS_ENV=production bundle exec rake db:create"
    end

    task :seed do
      run "cd #{current_path} && RAILS_ENV=production bundle exec rake db:seed"
    end

    task :reset do
      run "cd #{current_path} && RAILS_ENV=production bundle exec rake db:drop"
      run "cd #{current_path} && RAILS_ENV=production bundle exec rake db:create"
      run "cd #{current_path} && RAILS_ENV=production bundle exec rake db:migrate"
      run "cd #{current_path} && RAILS_ENV=production bundle exec rake db:seed"
    end
  end

end
