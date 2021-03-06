name 'travis_ci_php'
maintainer 'Travis CI GmbH'
maintainer_email 'contact+packer-templates@travis-ci.org'
license 'MIT'
description 'Installs/Configures travis_ci_php'
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version '0.1.0'

depends 'composer'
depends 'php'
depends 'rvm'
depends 'sweeper'
depends 'system_info'
depends 'travis_ci_standard'
