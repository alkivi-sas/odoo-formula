# -*- coding: utf-8 -*-
# vim: ft=sls

{% from "odoo/map.jinja" import odoo with context %}

odoo_service:
  service.running:
    - name: {{ odoo.service }}
    - enable: True
