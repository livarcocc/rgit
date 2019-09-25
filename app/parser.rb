require 'optparse'
require_relative 'strings'
require_relative 'commands/init_command'

class RGitParser
  def initialize(subcommands)
    options = {}

    @parser = OptionParser.new do |opts|
      opts.banner = USAGE
      opts.separator ""
      opts.separator MAIN_HELP
      opts.separator ""

      opts.on_tail("-h", "--help", HELP_DESCRIPTION) do
        puts opts
      end
    end

    @subcommands = subcommands
  end

  def parse(args)
    begin
      args << '--help' if args.empty?

      @parser.order!(args)
      commandName = args.shift
      command = nil

      if @subcommands.has_key?(commandName)
        command = @subcommands[commandName]
        command.parse(args)
      end

      command
    rescue OptionParser::MissingArgument
      puts $!.to_s
      puts "\n#{command.help}" if not command.nil?
    end
  end
end