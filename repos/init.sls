#!jinja|yaml

include:
{% if grains['os_family'] == 'Debian' %}
  - repos.salt
{% endif %}
