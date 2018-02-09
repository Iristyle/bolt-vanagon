platform "debian-7-amd64" do |plat|
  plat.servicedir "/etc/init.d"
  plat.defaultdir "/etc/default"
  plat.servicetype "sysv"
  plat.codename "wheezy"

  plat.add_build_repository "http://pl-build-tools.delivery.puppetlabs.net/debian/pl-build-tools-release-#{plat.get_codename}.deb"
  plat.add_build_repository "http://apt.puppetlabs.com/puppet5-release-#{plat_get_codename}.deb"
  plat.provision_with "curl http://apt.puppetlabs.com/pubkey.gpg | apt-key add - "
  plat.provision_with "curl http://nightlies.puppetlabs.com/07BB6C57 | apt-key add - "

  plat.provision_with "export DEBIAN_FRONTEND=noninteractive; apt-get update -qq; apt-get install -qy --no-install-recommends build-essential devscripts make quilt pkg-config debhelper rsync libssl-dev ruby-dev rubygems "
  plat.install_build_dependencies_with "DEBIAN_FRONTEND=noninteractive; apt-get install -qy --no-install-recommends "
  plat.vmpooler_template "debian-7-x86_64"
end
