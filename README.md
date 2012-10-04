Capifony Tools
==============

Handy tools for Capifony

## Features

* Vendor speedup
  Before every deploy the vendor directory of the previous deploy is copied
  to the new location to speed things up.

* Permissions
  After the symfony:cache:warmup command has been executed the permissions on
  the app/cache folder will be updated with setacl.

* APC
  After the deploy is completed the APC cache is cleared via the ApcBundle.

* Auto cleanup
  After the deploy is completed all old releases will be deleted.

## Installation

Require the package with Composer

``php composer.phar require ruudk/capifony-tools``

Add the following line to your capfile

````rb
load 'vendor/ruudk/capifony-tools/load.rb'
````