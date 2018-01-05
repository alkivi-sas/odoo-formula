# -*- coding: utf-8 -*-
# vim: ft=sls

{% from "odoo/map.jinja" import odoo with context %}

odoo_repo:
  pkgrepo.managed:
    - humanname: Odoo {{ odoo.version }}
    - name: deb http://nightly.odoo.com/{{ odoo.version }}/nightly/deb/ ./
    - file: /etc/apt/sources.list.d/odoo.list
    - keyid: 8183CBB5
    - keyserver: pgp.mit.edu
    - clean_file: true

odoo_dependencies:
  pkg.installed:
    - pkgs:
      - python-pypdf

odoo_pkg:
  pkg.installed:
    - name: {{ odoo.pkg }}
    - require:
      - pkgrepo: odoo_repo
      - pkg: odoo_dependencies
