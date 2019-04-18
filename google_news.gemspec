
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "google_news/version"

Gem::Specification.new do |spec|
  spec.name          = "google_news"
  spec.version       = GoogleNews::VERSION
  spec.authors       = ["kantarow"]
  spec.email         = ["kanta7306@gmail.com"]

  spec.summary       = %q{This gem can collect articles from Google news}
  spec.description   = %q{If you want to use Google news articles in your program, this gem will help you collect articles and handle them easily.}
  spec.homepage      = "https://github.com/kantarow/google-news"

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files         = Dir.chdir(File.expand_path('..', __FILE__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 2.0"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"
end
