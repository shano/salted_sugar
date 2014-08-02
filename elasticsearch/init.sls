elasticsearch:
  service:
    - running
    - enable: True

elasticsearch-deps:
  pkg: 
    - installed
    - names: 
      - openjdk-7-jre

elasticsearch_setup:
  cmd.script:
    - source: salt://elasticsearch/install.sh 
    - user: root
    - shell: /bin/bash
    - unless: "ls /usr/local/bin/ | grep elasticsearch"
    - require:
      - pkg: elasticsearch-deps

/usr/local/share/elasticsearch/bin/service/elasticsearch.conf:
  file.managed:
    - source: salt://elasticsearch/elasticsearch.conf
    - user: root
    - mode: 755
