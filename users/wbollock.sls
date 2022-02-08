#!jinja|yaml

add_wbollock_group:
  group.present:
    - name: wbollock
    - gid: 1000

add_wbollock:
  user.present:
    - name: wbollock
    - fullname: Will Bollock
    - shell: /bin/zsh
    - home: /home/wbollock
    - uid: 1000
    - groups:
    {% if grains['os_family'] == 'Debian' %}
      - sudo
    {% elif grains['os_family'] == 'RedHat' %}
      - wheel
    {% endif %}
      - wbollock

