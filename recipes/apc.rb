after 'deploy', 'symfony:apc'

namespace :symfony do
  task :apc, :roles => :app do
    pretty_print "--> Clearing APC opcode cache"

	run "cd #{latest_release} && #{php_bin} #{symfony_console} apc:clear --env=#{symfony_env_prod}"

    puts_ok
  end
end