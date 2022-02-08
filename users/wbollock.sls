#!jinja|yaml

wbollock:
  group.present:
    - gid: 1000

wbollock:
  user.present:
    - fullname: Will Bollock
    - shell: /bin/zsh
    - home: /home/wbollock
    - uid: 1000
    - gid: 1000
    - groups:
    {% if grains['os_family'] == 'Debian' %}
      - sudo
    {% elif grains['os_family'] == 'Redhat' %}
      - wheel
    {% endif %}

