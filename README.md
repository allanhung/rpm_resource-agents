RPMBUILD for resource-agents on centos
=========================

resource-agents rpm for centos (replace apache to nginx)

How to Build
=========

::

    git clone https://github.com/allanhung/rpm_resource-agents
    cd rpm_resource-agents
    docker run --name=resource-agents_build --rm -ti -v $(pwd)/rpms:/root/rpmbuild/RPMS -v $(pwd)/scripts:/usr/local/src/build centos /bin/bash -c "/usr/local/src/build/build.sh"

# check
::

    docker run --name=resource-agents_build --rm -ti -v $(pwd)/rpms:/root/rpmbuild/RPMS centos /bin/bash -c "yum localinstall -y /root/rpmbuild/RPMS/x86_64/resource-agents-*.rpm /root/rpmbuild/RPMS/x86_64/ldirectord-*.rpm"
