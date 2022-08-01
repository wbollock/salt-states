#!jinja|yaml

add_saltstack_repo:
  pkgrepo.managed:
    - humanname: Salt Upstream
    - name: deb https://repo.saltproject.io/py3/{{ grains.os | lower }}/{{ grains.osrelease }}/{{ grains.arch }}/latest {{ grains.oscodename }} main
    - key_url: https://repo.saltproject.io/py3/{{ grains.os | lower }}/{{ grains.osrelease }}/{{ grains.arch }}/latest/salt-archive-keyring.gpg
    - file: /etc/apt/sources.list.d/salt.list
    - require_in:
      - pkg: salt-minion

update_salt:
  pkg.latest:
    - name: salt-minion
    - refresh: true
