NAV Utvikler Ansible Playbook
=============================

Automatiserer oppsett av Linux utviklerimage og Jenkins byggservere.

# Komme i gang

## Fra et helt fersk Linuximage

```
su - 
yum install ansible git
exit

# ... fortsett med kommandoene under "Generelt" 

```

## Generelt
```
git clone https://github.com/navikt/utvikler-ansible.git
cd utvikler-ansible

cp example-inventory inventory
# update inventory with your own hosts
vi inventory

ansible-playbook -i inventory setup-playbook.yaml
```

## Eksempel-inventory

```
[all:vars]
http_proxy=http://webproxy.company.com:8088
https_proxy=http://webproxy.company.com:8088
no_proxy="localhost,127.0.0.1,.company.com,{{ansible_default_ipv4.address}}"

maven_internal_url=http://maven.domain.tld

[jenkins]
hostname.to.server1
hostname.to.server2

[jenkins:vars]
git_config_name=<jenkins git user>
git_config_email=<jenkins git email>

[linuximage]
localhost ansible_connection=local ansible_become_method=su ansible_become_pass=<root pw>

[linuximage:vars]
git_config_name=<your name>
git_config_email=<your email>

hostname_personlig_disk=hostname.tld
hostname_felles_disk=hostname.tld
```

# Roles

## `common` - Standardoppsett for alle hosts

Linux utviklerimage og Jenkins-servere deler både operativsystem (`RHEL`) og hvilken sone de befinner seg i, og har dermed endel oppsett til felles:

* Proxy-innstillinger, dersom dette er konfigurert
* Interne sertifikater
* Docker
* Google Chrome
* Git
* Java (OpenJDK 1.7 og 1.8)
* Maven
* Node og NPM

Hvilke versjoner som installeres beskrives i `group_vars/all`.

## `jenkins` - Jenkins byggserver

Det eneste som blir installert her, utover det som er beskrevet for `common`, er:

* Jenkins
* Git-config for `jenkins`-brukeren (`user.name` og `user.email`)

## `linuximage` - Linux utviklerimage

Foreløpig utfører `common` alle de nødvendige stegene, med untak av:

* Gir `sudo`-tilgang til brukeren din
* Mounter hjemmeområde og fellesdisk
* Git-config (`user.name` og `user.email`)
* Installerer HipChat og ICAClient