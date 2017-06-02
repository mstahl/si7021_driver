# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'si7021/version'

Gem::Specification.new do |spec|
  spec.name          = 'si7021'
  spec.version       = Si7021::VERSION
  spec.authors       = ['max thom stahl']
  spec.email         = ['max@villainousindustries.com']

  spec.summary       = %(Si7021 I2C driver for Ruby)
  spec.description   = %(Ruby interface to the Si7021 temperature/humidity sensor)
  spec.homepage      = 'https://github.com/mstahl/si7021'
  spec.license       = 'MIT'

  # Prevent pushing this gem to RubyGems.org. To allow pushes either set the
  # 'allowed_push_host' to allow pushing to a single host or delete this
  # section to allow pushing to any host.
  if spec.respond_to?(:metadata)
    spec.metadata['allowed_push_host'] = 'TODO: Set to "http://mygemserver.com"'
  else
    raise 'RubyGems 2.0 or newer is required to protect against ' \
      'public gem pushes.'
  end

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = 'exe'
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  spec.add_runtime_dependency 'i2c', '~> 0.4.0'
  spec.add_development_dependency 'bundler', '~> 1.15'
  spec.add_development_dependency 'rake', '~> 10.0'
  spec.add_development_dependency 'rspec', '~> 3.0'
end
