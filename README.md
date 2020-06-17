# Savon_fixes

This gem has been designed to be included if you require some of the open PRs on Savon and cannot upgrade the gem because of them.

![Build](https://github.com/lukaso/savon_fixes/workflows/Build/badge.svg)

# What does it do?

It monkey patches the Savon 2.12.0 version of the gem (will not work with other versions). This should not be a problem as it has been well over two years as of May 2020 since this version was release (17 Jan 2018).

# Usage

Add in your `Gemfile`

```ruby
gem 'savon_fixes'
```

Wherever you require `savon`, add:

```ruby
require 'savon_fixes'
```

So that should end up looking like:

```ruby
require 'savon'
require 'savon_fixes'
```

# PRs incorporated and bugs fixed

Currently there is only one fix incorporated. There are many issues filed against this problem as the stalebot shuts them all down.

- Bugs related to namespacing [#916](https://github.com/savonrb/savon/issues/916), [#899](https://github.com/savonrb/savon/issues/899), [#820](https://github.com/savonrb/savon/issues/820), [#895](https://github.com/savonrb/savon/issues/895), [#862](https://github.com/savonrb/savon/issues/862) and [#830](https://github.com/savonrb/savon/issues/830) which were all fixed by [#917](https://github.com/savonrb/savon/pull/917)

# Contributing

Please create PR and follow the monkey patching approach already taken. Also please ensure there is a working test for your fix and that all the tests continue to pass.

# Maintainers

Once all tests are passing, update `lib/savon_fixes/version.rb` to a new version, commit to `master` and the gem will be pushed to rubygems.
