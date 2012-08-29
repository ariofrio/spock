require 'spock'
require 'trollop'

class Spock
  module CLI
    class << self
      include Trollop

      def run(args = ARGV)
        opts = options args do
          banner <<EOS
Usage: spock [CONFIG]
Merge multiple directories into one using symlinks.

If CONFIG is not given, try ~/.spockrc, ~/Dropbox/.spockrc, ~/Dropbox/Apps/Spock/spockrc, in that order.
 
EOS
          opt :dry_run, "Don't actually merge anything; just print",
            :short => '-n'
          version Spock::VERSION
        end
        
        spock = Spock.new ARGV[0], opts
        spock.merge
      end
    end
  end
end
