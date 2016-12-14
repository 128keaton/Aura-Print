# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "aura-print/version"

Gem::Specification.new do |s|
  s.name        = "AuraPrint"
  s.version     = AuraPrint::VERSION
  s.platform    = Gem::Platform::RUBY
  s.authors     = ["Keaton Burleson"]
  s.email       = ["keaton.burleson@me.com"]
  s.homepage    = ""
  s.summary     = %q{A gem which manages printing.}
  s.description = %q{A gem which manages printing between barcodeWeb and the user's machine.}

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]

  s.add_dependency "unirest"
end
