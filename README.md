andrewrothstein.secretless_broker
=========
[![Build Status](https://travis-ci.org/andrewrothstein/ansible-secretless_broker.svg?branch=master)](https://travis-ci.org/andrewrothstein/ansible-secretless_broker)

Installs CyberArk's [secretless-broker](https://github.com/cyberark/secretless-broker)

Requirements
------------

See [meta/main.yml](meta/main.yml)

Role Variables
--------------

See [defaults/main.yml](defaults/main.yml)

Dependencies
------------

See [meta/main.yml](meta/main.yml)

Example Playbook
----------------

```yml
- hosts: servers
  roles:
    - andrewrothstein.secretless_broker
```

License
-------

MIT

Author Information
------------------

Andrew Rothstein <andrew.rothstein@gmail.com>
