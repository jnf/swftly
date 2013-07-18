
Gem::Specification.new do |spec|
  spec.name           = 'swftly'
  spec.version        = '0.0.01pre'
  spec.summary        = "swftly abstracts and automates interactions with Swiffy, Google's hosted swf converter."
  spec.description    = "The summary summarizes sumarily."
  spec.platform       = Gem::Platform::CURRENT
  spec.require_path   = '.'
  spec.authors        = ["jnf"]
  spec.email          = 'jeremy.flores@gmail.com'
  spec.files          = ["lib/swftly.rb", "lib/swftly/runtime.rb"]
  spec.homepage       = 'https://rubygems.org/gems/swftly'

  #get some dependencies up in here up in here
  spec.add_development_dependency "rspec" #testing whatnots
  spec.add_development_dependency "curb", "~> 0.8.4" #we'll use curl to talk to swiffy
end