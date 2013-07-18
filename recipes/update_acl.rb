after 'symfony:cache:warmup', 'symfony:update_acl'

namespace :symfony do
  task :update_acl, :roles => :app do
    capifony_pretty_print "--> Sets permissions using ACL for writable dirs"

    dirs = writable_dirs
    dirs.delete(app_path + "/cache")

    run "cd #{latest_release} && setfacl -d -P -m u:#{webserver_user}:rwx -m u:#{user}:rwx #{dirs.join(" ")}"

    capifony_puts_ok

    capifony_pretty_print "--> Sets permissions using ACL for app/cache"

    run "cd #{latest_release} && setfacl -R -m u:#{webserver_user}:rwx -m u:#{user}:rwx #{app_path + "/cache"}"
    run "cd #{latest_release} && setfacl -dR -m u:#{webserver_user}:rwx -m u:#{user}:rwx #{app_path + "/cache"}"

    capifony_puts_ok
  end
end