# Metasploit Framework
#
#  https://github.com/ipwnstuff/omnibus-metasploit
#
name 'metasploit-framework'
version '4.7.0'
relative_path 'metasploit-framework-4.7.0'
source :url => 'https://github.com/rapid7/metasploit-framework/archive/4.7.0.tar.gz',
       :md5 => '45a13768b636265a4a34271df22318ea'

dependency 'curl'
dependency 'rsync'
dependency 'ruby'

dependency 'rubygems'
dependency 'bundler'

dependency 'libpcap'
dependency 'libtool'
dependency 'libxml2'
dependency 'libxslt'

# NOTE: MSF includes a Mac binary under data/ to be used in modules
whitelist_file 'isight.bundle'

build do
  bundle "install --path=#{install_dir}/embedded/gem"
  command "mkdir -p #{install_dir}/framework"
  command "#{install_dir}/embedded/bin/rsync -a --delete --exclude=.git/*** --exclude=.gitignore ./ #{install_dir}/framework/"
end
