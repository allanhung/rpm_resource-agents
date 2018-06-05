export RPMBUILDROOT=/root/rpmbuild

yum -y install rpm-build rpmdevtools make patch
mkdir -p $RPMBUILDROOT/SOURCES && mkdir -p $RPMBUILDROOT/SPECS && mkdir -p $RPMBUILDROOT/SRPMS
# fix rpm marcos
sed -i -e "s#.centos##g" /etc/rpm/macros.dist

curl -s -o /tmp/ra.rpm http://rpmfind.net/linux/fedora/linux/development/rawhide/Everything/source/tree/Packages/r/resource-agents-4.1.1-1.fc29.1.src.rpm
rpm -i /tmp/ra.rpm
sed -i -e "/perl-generators/s/^BuildRequires/#BuildRequires/g" -e "/perl-interpreter/s/^BuildRequires/#BuildRequires/g" $RPMBUILDROOT/SPECS/resource-agents.spec
yum-builddep -y $RPMBUILDROOT/SPECS/resource-agents.spec
rpmbuild -bb $RPMBUILDROOT/SPECS/resource-agents.spec
