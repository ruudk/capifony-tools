after 'deploy', 'deploy:auto_cleanup'

namespace :deploy do
  task :auto_cleanup, :roles => :app do
    pretty_print "--> Cleaning up old releases"

	deploy.cleanup

    puts_ok
  end
end