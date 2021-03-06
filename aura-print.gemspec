# -*- encoding: utf-8 -*-
$LOAD_PATH.push File.expand_path('../lib', __FILE__)

Gem::Specification.new do |s|
    s.name = 'AuraPrint'
    s.version     = '0.0.5'
    s.platform    = Gem::Platform::RUBY
    s.authors     = ['Keaton Burleson']
    s.email       = ['keaton.burleson@me.com']
    s.homepage    = 'https://github.com/128keaton/Aura-Print'
    s.summary     = 'A gem which manages printing.'
    s.description = "A gem which manages printing between barcodeWeb and the user's machine."

    s.files = ['lib/aura-print.rb']
    s.require_paths = ['lib']
    s.license = 'MIT'
    s.add_dependency 'barby', '~> 0'
    s.add_dependency 'unirest'
end
