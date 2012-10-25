after 'deploy:migrations', 'symfony:apc'
after 'deploy', 'symfony:apc'

namespace :symfony do
  task :apc, :roles => :app do
    capifony_pretty_print "--> Clearing APC opcode cache"

    run "cd #{latest_release} && #{php_bin} #{symfony_console} apc:clear --env=#{symfony_env_prod}"

    capifony_puts_ok
  end
end