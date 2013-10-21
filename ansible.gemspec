## ansible.gemspec
#

Gem::Specification::new do |spec|
  spec.name = "ansible"
  spec.version = "0.4.2"
  spec.platform = Gem::Platform::RUBY
  spec.summary = "ansible"
  spec.description = "description: ansible kicks the ass"

  spec.files =
["README.md", "Rakefile", "ansible.gemspec", "lib", "lib/ansible.rb"]

  spec.executables = []
  spec.license = "same as ruby's" 
  
  spec.require_path = "lib"

  spec.test_files = nil

### spec.add_dependency 'lib', '>= version'
#### spec.add_dependency 'map'

  spec.extensions.push(*[])

  spec.rubyforge_project = "codeforpeople"
  spec.author = "Ara T. Howard"
  spec.email = "ara.t.howard@gmail.com"
  spec.homepage = "https://github.com/ahoward/ansible"
end
