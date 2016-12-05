# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'china_location/version'

Gem::Specification.new do |spec|
  spec.name          = "china_location"
  spec.version       = ChinaLocation::VERSION
  spec.authors       = ["zhuangshunhe"]
  spec.email         = ["302643159@qq.com"]
  spec.summary       = %q{根据中国的省市获取经纬度和邮编}
  spec.description   = %q{根据中国的省市获取经纬度和邮编, 精确到县区}
  spec.homepage      = "https://github.com/radiocontroller/china-location"
  spec.license       = "MIT"

  # Prevent pushing this gem to RubyGems.org. To allow pushes either set the 'allowed_push_host'
  # to allow pushing to a single host or delete this section to allow pushing to any host.
  if spec.respond_to?(:metadata)
    spec.metadata['allowed_push_host'] = "https://rubygems.org"
  else
    raise "RubyGems 2.0 or newer is required to protect against public gem pushes."
  end

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]
  spec.required_ruby_version = '>= 1.9.3'

  spec.add_development_dependency "bundler", "~> 1.12"
  spec.add_development_dependency "rake", "~> 10.0"
end
