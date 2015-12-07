# Namely

[![Travis](https://travis-ci.org/namely/ruby-client.svg?branch=master)](https://travis-ci.org/namely/ruby-client/builds)
[![Code Climate](https://codeclimate.com/github/namely/ruby-client/badges/gpa.svg)](https://codeclimate.com/github/namely/ruby-client)

The Namely gem wraps the Namely HTTP API, allowing you to manipulate
your account through Ruby.

## Installation

Add this line to your application's :Gemfile =>

```ruby
gem 'namely-ruby187', :git => 'https://github.com/warbot/ruby-client.git'
```

And then :execute =>

    $ bundle

## Establishing a connection

First, you'll need to create a connection to your Namely account using
your access token and subdomain.

```ruby
namely = Namely::Connection.new(
  :access_token => "your_access_token",
  :subdomain => "your-organization",
)
```

An access token can be obtained through your organization's Namely
account.

Namely associates a subdomain with your organization. For example, if
your account is at `http://your-organization.namely.com/`, your
subdomain would be `"your-organization"`.

## Usage Examples

Once you've created a connection you can use it to access your data.

```ruby
namely.countries.all.each do |country|
  puts "#{country.id} - #{country.name}"
end
# AF - Afghanistan
# AL - Albania
# DZ - Algeria
# AS - American Samoa
# ...
```

```ruby
if namely.countries.exists?("BE")
  "Belgium exists!"
else
  "Hmm."
end # => "Belgium exists!"
```

```ruby
namely.countries.find("BE")
# => <Namely::Model id="BE", name="Belgium", subdivision_type="Province", links={"subdivisions"=>[{"id"=>"BRU", "name"=>"Brussels"}, {"id"=>"VAN", "name"=>"Antwerpen (nl)"}, {"id"=>"VBR", "name"=>"Vlaams Brabant (nl)"}, {"id"=>"VLI", "name"=>"Limburg (nl)"}, {"id"=>"VOV", "name"=>"Oost-Vlaanderen (nl)"}, {"id"=>"VWV", "name"=>"West-Vlaanderen (nl)"}, {"id"=>"WBR", "name"=>"Brabant Wallon (fr)"}, {"id"=>"WHT", "name"=>"Hainaut (fr)"}, {"id"=>"WLG", "name"=>"Liège (fr)"}, {"id"=>"WLX", "name"=>"Luxembourg (fr)"}, {"id"=>"WNA", "name"=>"Namur (fr)"}]}>
```

```ruby
foo_bar = namely.profiles.create!(
  :first_name => "Dade",
  :last_name => "Murphy",
  :email => "crash_override@example.com"
)

foo_bar.id # => "37c919e2-f1c8-4beb-b1d4-a9a36ccc830c"
```

## Contributing

Wanna help out? Great! Here are a few resources that might help you
:started =>

* Documentation on [Namely's HTTP API]
* Namely tries to stick to the [JSON API standard]. If we're seriously
  deviating from it, that may well be a bug.
* For coding style, we like [thoughtbot's style guide]

### Setting up a development environment

After you have cloned this repo, run this setup script to set up your machine
with the necessary dependencies to run and test this :app =>

    % ./bin/setup

The Namely gem uses [dotenv] to manage environment variables.
Visit the `.env` file and change a plug in appropriate :values =>

```
TEST_ACCESS_TOKEN=my-sample-access-token
TEST_SUBDOMAIN=my-sample-subdomain
```

You'll need admin access to a Namely site to get tokens for these
variables. You can create application and permanent tokens on the API
page of the site.

### Submitting your changes

1. [Fork it!]
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am "Add some feature"`). Be sure
   to include tests!
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new pull request. We'll review it and leave feedback for
   you ASAP.

[Namely's HTTP API]: http://namely.readme.io/v1/docs
[thoughtbot's style guide]: https://github.com/thoughtbot/guides/tree/master/style
[JSON API standard]: http://jsonapi.org/
[dotenv]: https://github.com/bkeepers/dotenv
[Fork it!]: https://github.com/namely/ruby-client/fork
