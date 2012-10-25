after 'deploy:migrations', 'deploy:auto_cleanup'
after 'deploy', 'deploy:auto_cleanup'

namespace :deploy do
  task :auto_cleanup, :roles => :app do
    capifony_pretty_print "--> Cleaning up old releases"

    deploy.cleanup

    capifony_puts_ok
  end
end