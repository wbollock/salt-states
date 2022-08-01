#!jinja|yaml

add_wbollock_group:
  group.present:
    - name: wbollock
    # raspbian takes user pi as gid/uid 1000
    {% if grains.os | lower != 'raspbian' %}
    - gid: 1000
    {% else %}
    - gid: 1003
    {% endif %}

add_wbollock:
  user.present:
    - name: wbollock
    - fullname: Will Bollock
    - shell: /bin/zsh
    - home: /home/wbollock
    {% if grains.os | lower != 'raspbian' %}
    - uid: 1000
    {% else %}
    - uid: 1003
    {% endif %}
    - groups:
    {% if grains['os_family'] == 'Debian' %}
      - sudo
    {% elif grains['os_family'] == 'RedHat' %}
      - wheel
    {% endif %}
      - wbollock

