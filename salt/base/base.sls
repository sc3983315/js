epel-repo:
  pkg.installed:
    - sources:
      - epel-release: salt://base/files/epel-release-5-4.noarch.rpm 
    - order: 1
