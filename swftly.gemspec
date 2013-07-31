Gem::Specification.new do |spec|
  spec.name           = 'swftly'
  spec.version        = '0.1.42'
  spec.summary        = "swftly abstracts and automates interactions with Swiffy, Google's hosted swf converter."
  spec.description    = "swftly abstracts and automates interactions with Swiffy, Google's hosted swf converter."
  spec.platform       = Gem::Platform::RUBY
  spec.files          = `git ls-files`.split("\n")
  spec.test_files     = `git ls-files -- {spec,features}/*`.split("\n")
  spec.require_paths  = %w(lib)
  spec.authors        = ["jnf"]
  spec.email          = 'jeremy.flores@gmail.com'
  spec.homepage       = 'https://github.com/jnf/swftly'
  spec.license        = 'MIT'

  #for always
  spec.add_dependency "curb", "~> 0.8.4" #we'll use curl to talk to swiffy

  #for dev/testing
  spec.add_development_dependency "rspec"
  spec.add_development_dependency "vcr"
  spec.add_development_dependency "webmock"
end
