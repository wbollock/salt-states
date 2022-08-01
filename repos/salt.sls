#!jinja|yaml

add_saltstack_repo:
  pkgrepo.managed:
    - humanname: Salt Upstream
    # raspbian is close but different so just make a new clause tbh
    {% if grains.os | lower != 'raspbian' %}
    - name: deb https://repo.saltproject.io/py3/{{ grains.os | lower }}/{{ grains.osrelease }}/{{ grains.osarch }}/latest {{ grains.oscodename }} main
    - key_url: https://repo.saltproject.io/py3/{{ grains.os | lower }}/{{ grains.osrelease }}/{{ grains.osarch }}/latest/salt-archive-keyring.gpg
    {% else %}
    - name: deb https://repo.saltproject.io/py3/{{ grains.os_family | lower }}/{{ grains.osmajorrelease }}/{{ grains.osarch }}/latest {{ grains.oscodename }} main
    - key_url: https://repo.saltproject.io/py3/{{ grains.os_family | lower }}/{{ grains.osmajorrelease }}/{{ grains.osarch }}/latest/salt-archive-keyring.gpg
    {% endif %}
    - file: /etc/apt/sources.list.d/salt.list
    - require_in:
      - pkg: salt-minion

update_salt:
  pkg.latest:
    - name: salt-minion
    - refresh: true
