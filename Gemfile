source "https://ruby.taobao.org"

gemspec
gem "rake"
gem "pry"

group :test do
  gem "rspec", "~> 2.13"

  if ENV["CI"]
    gem "coveralls", :require => false
  else
    gem "guard-rspec"
    gem "rb-fsevent"
  end
end
