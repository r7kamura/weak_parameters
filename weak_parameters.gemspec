# frozen_string_literal: true

require_relative "lib/weak_parameters/version"

Gem::Specification.new do |spec|
  spec.name          = "weak_parameters"
  spec.version       = WeakParameters::VERSION
  spec.authors       = ["Ryo Nakamura"]
  spec.email         = ["r7kamura@gmail.com"]
  spec.summary       = "Add a validation filter to your controller."
  spec.homepage      = "https://github.com/r7kamura/weak_parameters"
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.require_paths = ["lib"]

  spec.add_dependency "rails", ">= 4.0.0"
end
