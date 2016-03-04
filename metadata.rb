name             'zsh'
maintainer       "Ares"
maintainer_email "ar3s.cz@gmail.com"
license          "All rights reserved"
description      "Installs/Configures zsh"
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version          "0.3.2"

depends	'user', '>= 0.1.0'
depends	'git', '>= 0.0.1'
depends	'essential_tools', '>= 0.0.1'

attribute 'node_machine_color',
          :display_name => 'Prompt color',
          :description => 'Color of zsh prompt',
          :type => 'string',
          :required => 'optional',
          :default => 'green'
