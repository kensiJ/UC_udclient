"UrbaCode" Install udclient CLI module for Puppet
===
Description
---
This installation For RedHat OS only.

Usage
---
```python
class { 'udclient': }
```
Installs the udclient Command-line client (CLI).
It used default parameters, see parameters below.

Parameters
---
**udclient:[udclient_zip]** - udclient zip to be installed, you can create it by urself if you need other UrbanCode Version
Default value: `udclient_zip = 'udclient.zip'`
**udclient:[destination_dir]** - destination directory where udclient will be installed 
Default value: `destination_dir	= '/usr/local'`

Other examples
---
```python
class { 'udclient':
    udclient_zip      => 'udclient.zip',
    destination_dir   => '/usr/local',
}
```
