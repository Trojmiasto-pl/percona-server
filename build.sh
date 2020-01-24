#!/bin/bash

REV=$( git describe --tags | awk -F '-' '{print $6}' )
REL=$( git describe --tags | awk -F '-' '{print $4}' )
cmake . \
  -DCMAKE_BUILD_TYPE=RelWithDebInfo \
  -DBUILD_CONFIG=mysql_release \
  -DFEATURE_SET=community \
  -DWITH_EMBEDDED_SERVER=OFF \
  -DENABLE_DTRACE=off \
  -DCOMPILATION_COMMENT="Percona Server (GPL), Release $REL, Revision $REV"
  -DENABLE_DOWNLOADS=1
make
strip sql/mysqld
