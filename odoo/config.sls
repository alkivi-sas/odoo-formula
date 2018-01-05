# -*- coding: utf-8 -*-
# vim: ft=sls

{% from "odoo/map.jinja" import odoo with context %}

include:
  - odoo.install
  - odoo.service

/etc/odoo:
  file.directory:
    - user: root
    - group: root
    - mode: 755

/etc/odoo/openerp-server.conf:
  file.managed:
    - user: odoo
    - group: odoo
    - mode: 640
    - template: jinja
    - source: salt://odoo/templates/server.conf.jinja
    - require:
      - pkg: odoo_pkg
    - watch_in:
      - service: odoo_service

