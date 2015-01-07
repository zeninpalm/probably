Gem::Specification.new do |s|
  s.name = "probably"
  s.version = "0.2.0"
  s.summary = "Enables you to chain calls without explicitly checking nils or exceptions"
  s.email = "yiwei.in.cyber@gmail.com"
  s.homepage = "http://github.com/zeninpalm/probably/"
  s.description = ""
  s.authors = ["Yi Wei"]
  s.files = [ "License.txt",
             "README.md",
             "lib/probably.rb",
             "lib/probably/version.rb",
            "lib/probably/delayed_invocation.rb"]
  s.test_files = [
      "spec/probably_spec.rb",
      "spec/spec_helper.rb"]
  s.rdoc_options = ["--main", "README.md"]
  s.extra_rdoc_files = ["README.md"]
end
