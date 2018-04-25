
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "destinations/version"

Gem::Specification.new do |spec|
  spec.name          = "destinations"
  spec.version       = Destinations::VERSION
  spec.authors       = ["Annabel Wilmerding"]
  spec.email         = ["annabelwilmerding@gmail.com"]

  spec.summary       = %q{Top Vacation Spots}
  spec.description   = %q{Top Vacation Spots}
  spec.homepage      = "https://learn.co"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.executables   = "top-destinations"
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.16"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"
  spec.add_development_dependency "pry"

  spec.add_dependency "nokogiri"

end
