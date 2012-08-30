# Spock [![Code Climate](https://codeclimate.com/badge.png)](https://codeclimate.com/github/ariofrio/oration)

Merge multiple directories into one using symlinks (copies on Windows). It's like [Spock][]'s mind meld. Kind of. Not really.

  [spock]: http://en.wikipedia.org/wiki/Spock

## Installation

    gem install spock

## Usage

See [spock/examples][] for sample configuration files. Place yours in ~/.spockrc, ~/Dropbox/.spockrc, or ~/Dropbox/Apps/Spock/spockrc. Then, run

    spock --dry-run

If you are satisfied, run

    spock

You can also a configuration file anywhere by running

    spock path/to/my/spockrc

  [spock/examples]: https://github.com/ariofrio/spock/tree/master/examples

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Added some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request

## History

0.0.2:

 - Fix "uninitialized constant Spock::FileUtils" error

0.0.1:

 - Support for target prefix (useful for dotfile management)
 - Support for multiple sources, first takes precedence
 - Support for Windows using simple copies

