#!/bin/bash

# TODO ADD APPROPRIATE WEB USER AND FOLDER
APACHEUSER='www-data:www-data'
SUGARPATH='/var/www/<YOUR_SUGAR_INSTALL_FOLDER>'

find -P $SUGARPATH/ -type d -exec chmod 755 {} \;
find -P $SUGARPATH/ -type f -exec chmod 644 {} \;
find -P $SUGARPATH/ -name *.js -exec chmod 755 {} \;

chmod 664 $SUGARPATH/config.php
chmod 664 $SUGARPATH/config_override.php
chmod 664 $SUGARPATH/sugarcrm.log

find -P $SUGARPATH/cache -type d -exec chmod 775 {} \;
find -P $SUGARPATH/custom -type d -exec chmod 775 {} \;
find -P $SUGARPATH/data -type d -exec chmod 775 {} \;
find -P $SUGARPATH/modules -type d -exec chmod 775 {} \;
find -P $SUGARPATH/include -type d -exec chmod 775 {} \;
find -P $SUGARPATH/upload -type d -exec chmod 775 {} \;

find -P $SUGARPATH/cache -type f -exec chmod 664 {} \;
find -P $SUGARPATH/custom -type f -exec chmod 664 {} \;
find -P $SUGARPATH/data -type f -exec chmod 664 {} \;
find -P $SUGARPATH/modules -type f -exec chmod 664 {} \;
find -P $SUGARPATH/include -type f -exec chmod 664 {} \;
find -P $SUGARPATH/upload -type f -exec chmod 664 {} \;

chown -R $APACHEUSER $SUGARPATH
