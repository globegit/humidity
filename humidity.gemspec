# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "humidity/version"

Gem::Specification.new do |s|
  s.name        = "humidity"
  s.version     = Humidity::VERSION
  s.platform    = Gem::Platform::RUBY
  s.authors     = ["David Salisbury"]
  s.email       = ["salisbury@globe.gov"]
  s.homepage    = "http://github.com/globegit/humidity"
  s.summary     = %q{calculates relative air humidty}
  s.description = %q{calculates air humidity in % when given elevation, dry and wet bulb temperatures}

  s.rubyforge_project = "humidity"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]
end
