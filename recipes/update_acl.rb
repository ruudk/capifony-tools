after 'symfony:cache:warmup', 'symfony:update_acl'

namespace :symfony do
  task :update_acl, :roles => :app do
    pretty_print "--> Sets permissions using ACL for app/cache"

    run "cd #{latest_release} && setfacl -R -m u:apache:rwx -m u:$USER:rwx #{app_path + "/cache"}"
    run "cd #{latest_release} && setfacl -dR -m u:apache:rwx -m u:$USER:rwx #{app_path + "/cache"}"

    puts_ok
  end
end