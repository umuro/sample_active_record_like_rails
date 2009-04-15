Purpose
=======
To test and demo cs_active_scaffold_like, a library that delegates persistance responsibility to other places.
Installation
============
Requirements
------------
$ sudo apt-get install build-essential sqlite3 swig libsqlite3-ruby libsqlite3-dev
This application requires sqlite. In fact it's a databaseless application that still uses active_record.
In memory database is used as a workaround for this.
I wish I could get rid of database connection alltogether.
Any help about this is appreciated <umur.ozkul@gmail.com>

Install project plugins and gems
-----------------------------------
$ cd <ProjectRoot>
$ rake cs:plugins:git:install
$ sudo rake gems:install

(See lib/tasks/plugin_install.rake to see how git modules have been added)

Update later
============
$ git pull
$ git submodule update
