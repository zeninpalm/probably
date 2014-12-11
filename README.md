Probably
=============

Probably is an extremely lightweight and simple tool. It only exists for one reason: to avoid checking for nil or exception in a calls chain. So, instead of writing like this:
```ruby
visitors.most_recent.try(:last).first_name || "NoSuchAnUser"
```
you write like this
```ruby
visitors.probably.most_recent.last.first_name.or("NoSuchAnUser")
```
or in a more natural way:
```ruby
probably(visitors).most_recent.last.first_name.or("NoSuchAnUser")
```

Install
===============
```ruby
gem install probably
```

or in your Gemfile:
```ruby
gem "probably"
```

or like this
```ruby
gem "probably", :git => "git://github.com/zeninpalm/probably.git"
```

Usage
================

The simplest scenario

```ruby
class Statistics
  include Probably
  attr_reader :visitors

  def latest_visitor
    probably(visitors).most_recent.last.first_name.or("NoSuchAnUser")
  end
end

end
```
you many want to check probably_spec.rb for more examples, they are quite simple and intutive!

