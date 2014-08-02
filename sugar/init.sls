# TODO - YOU MAY NEED TO CHANGE USER/PERMISSIONS
/etc/apache2/sites-available/default: 
  file.managed:
    - source: salt://sugar/apache/vhosts/default
    - user: root
    - mode: 644

/etc/apache2/sites-enabled/000-default:
  file.symlink:
    - target: /etc/apache2/sites-available/default

/etc/apache2/sites-available/sugar:
  file.managed:
    - source: salt://sugar/apache/vhosts/sugar
    - user: root
    - mode: 644

/etc/apt/preferences:
  file.managed:
    - source: salt://sugar/php/apt_preferences
    - user: root
    - mode: 644

/etc/apache2/sites-enabled/sugar.conf:
  file.symlink:
    - target: /etc/apache2/sites-available/sugar

/etc/php5/apache2/php.ini:
  file.managed:
    - source: salt://sugar/apache/php.ini
    - user: root
    - mode: 644

sugar_permissions:
  cmd.script:
    - source: salt://sugar/permissions.sh
    - user: root
    - group: root
    - shell: /bin/bash

# TODO - CHANGE YOUR_SUGAR_INSTALL_FOLDER to wherever the codebase is
/var/www/<YOUR_SUGAR_INSTALL_FOLDER>/upload:
  file.directory:
    - mode: 755
    - makedirs: True
    - user: www-data

/var/www/<YOUR_SUGAR_INSTALL_FOLDER>/cache:
  file.directory:
    - mode: 755
    - makedirs: True
    - user: www-data

# TODO - COPY SUGAR'S config.php TO THE SUGAR DIRECTORY
/var/www/<YOUR_SUGAR_INSTALL_FOLDER>/config.php:
  file.managed:
    - source: salt://sugar/config.php
    - user: www-data
    - mode: 664

# TODO - COPY SUGAR'S config_override.php TO THE SUGAR DIRECTORY
/var/www/<YOUR_SUGAR_INSTALL_FOLDER>/config_override.php:
  file.managed:
    - source: salt://sugar/config_override.php
    - user: www-data
    - mode: 664

# TODO - COPY SUGAR'S generated_htaccess TO THE SUGAR DIRECTORY
/var/www/<YOUR_SUGAR_INSTALL_FOLDER>/.htaccess:
  file.managed:
    - source: salt://sugar/apache/htaccess
    - user: www-data
    - group: www-data
    - mode: 755

# TODO - REMOVE IF YOU DON'T USE COMPOSER WITH SUGAR
/var/www/<YOUR_SUGAR_INSTALL_FOLDER>:
  composer.installed:
    - no_dev: false
    - require:
      - cmd: install-composer
