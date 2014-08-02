essential-packages:
  pkg.installed:
    - names:
      - sysstat
      - git
      - tmux
      - htop
      - unrar
      - unzip

/etc/default/sysstat:
  file.managed:
    - source: salt://requirements/sysstat
    - user: root
    - mode: 755
