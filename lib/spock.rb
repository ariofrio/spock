require "spock/version"

class Spock

  def initialize(config_file = nil, opts = {})
    if config_file.nil?
      config_file = "#{ENV['HOME']}/.spockrc"
      config_file = "#{ENV['HOME']}/Dropbox/.spockrc" \
        if not File.exists? config_file
      config_file = "#{ENV['HOME']}/Dropbox/Apps/Spock/spockrc" \
        if not File.exists? config_file
      throw "No spockrc in default locations" if not File.exists? config_file
    end
    throw "#{config_file}: No such file or directory" if not File.exists? config_file
    @config_file = config_file
    @opts = opts
  end

  def merge
    config = Config.new
    config.instance_eval(binread(@config_file), @config_file)
    
    config.sources.reverse.each do |source|
      if not File.directory? source
        puts "Not found: source directory #{source}"
        next
      end
      Dir.chdir(source) do
        Dir['*'].each do |path|
          source_file = File.join(source, path)
          target_file = File.join(config.target, config.target_prefix + path)
          
          if needs_replacement? source_file, target_file
            puts "Merging #{target_file} from #{source}"
            merge_file source_file, target_file
          else
            puts "Skipping #{target_file}"
          end
        end
      end
    end
  end

  def merge_file(source_file, target_file)
    if not @opts[:dry_run]
      FileUtils.rm_rf target_file
      if symlink_supported?
        File.symlink source_file, target_file
      else
        FileUtils.cp_r :preserve => true
      end
    end
  end

  def needs_replacement?(source_file, target_file)
    if symlink_supported?
      not File.symlink? target_file or
      not File.readlink(target_file) == source_file
    else
      not File.exists? target_file or
      not File.size(target_file) == File.size(source_file) or
      not binread(target_file) == binread(source_file)
    end
  end

  def symlink_supported?
    not RbConfig::CONFIG["host_os"] =~
        %r!(msdos|mswin|djgpp|mingw|[Ww]indows)!
  end

  def binread(file)
    File.open(file, 'rb:ASCII-8BIT') { |f| f.read }
  end

  class Config
    attr_reader :sources, :target, :target_prefix
    def initialize; @sources = []; @target = nil; @target_prefix = ''; end

    def from(str); @sources << File.expand_path(str); end
    def to(str); @target = File.expand_path(str); end
    def to_prefix(str); @target_prefix = str; end
  end

end
