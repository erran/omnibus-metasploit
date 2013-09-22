name 'metasploit'
maintainer 'Rapid7 Inc.'
homepage 'rapid7.com'

replaces        'metasploit'
install_path    '/opt/metasploit'
build_version   '4.7.0'
build_iteration 1

# creates required build directories
dependency 'preparation'
dependency 'metasploit-framework'
dependency 'version-manifest'

exclude '\.git*'
exclude 'bundler\/git'
