before 'symfony:composer:install', 'composer:copy_vendors'
before 'symfony:composer:update', 'composer:copy_vendors'

namespace :composer do
  task :copy_vendors, :except => { :no_release => true } do
    capifony_pretty_print "--> Copy vendor file from previous release"

    run "vendorDir=#{current_path}/vendor; if [ -d $vendorDir ] || [ -h $vendorDir ]; then cp -a $vendorDir #{latest_release}/vendor; fi;"
    capifony_puts_ok
  end
end