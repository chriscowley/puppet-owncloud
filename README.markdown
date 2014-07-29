####Table of Contents

1. [Overview](#overview)
2. [Module Description - What the module does and why it is useful](#module-description)
3. [Setup - The basics of getting started with owncloud](#setup)
    * [What owncloud affects](#what-owncloud-affects)
    * [Setup requirements](#setup-requirements)
    * [Beginning with owncloud](#beginning-with-owncloud)
4. [Usage - Configuration options and additional functionality](#usage)
5. [Reference - An under-the-hood peek at what the module is doing and how](#reference)
5. [Limitations - OS compatibility, etc.](#limitations)
6. [Development - Guide for contributing to the module](#development)

##Overview

Installs Owncloud and optionally configures [Owncloud](http://www.owncloud.org).

##Module Description

The most simple options just deploy Owncloud. Optionally, it can also configure both Owncloud and the web server (currenly on Nginx/PHP-FPM).

##Setup

###What owncloud affects

* The installer file is placed in /`opt`.
* This install is expanded into `/var/www/owncloud`

Optional:
* The configuration file `/var/www/owncloud/config/config.php` is created
* The configuration file for Nginx is created

###Setup Requirements **OPTIONAL**

Only `curl` needs to be installed. For the module to work, no others are required. Other modules to control your web server and PHP are required.

For larger installs, you will also need MySQL.

Personally I use:

* PHP: http://forge.puppetlabs.com/thias/php
* NGinx: http://forge.puppetlabs.com/garethr/nginx
* MySQL: http://forge.puppetlabs.com/puppetlabs/mysql

You can use whatever suits you (or even none at all if that is what floats your boat).

###Beginning with owncloud

The most basic usage is 

```
node owncloud.example.com {
    class { 'owncloud': }
}
```

Or if using Hiera:

```
---
classes:
  - owncloud
```

That will just install version 7.0.0 (current at time of writing). No configuration is performed.

##Usage

A more advanced use case would be:

```
---
classes:
  - mysql
  - owncloud
owncloud::releasever: 7.1.0
owncloud::webserver: nginx
owncloud::ssl
owncloud::servername: owncloud.example.com
```

Should be pretty self-explanitory, but this will install Owncloud 7.1.0, then configure Nginx with an SSL virtual Host.


##Limitations

Currently tested only on CentOS 6. It will not work on Debian/Ubuntu, but I have put `case` statements in place to make it easy in the future.

Currently only supports Nginx as the web server. Again, `case` statements are there to allow support for other web servers.

##Development

Feel free to fork and send any pull requests.
