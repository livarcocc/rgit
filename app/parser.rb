require 'optparse'
require_relative 'strings'

class RGitParser
  attr_accessor :parser, :subcommands

  def initialize
    options = {}
    helpText = MAIN_HELP

    self.parser = OptionParser.new do |opts|
      opts.banner = USAGE
      opts.separator ""
      opts.separator helpText
      opts.separator ""

      opts.on_tail("-h", "--help", HELP_DESCRIPTION) do
        puts opts
        exit
      end
    end

    self.subcommands = {
      'add' => OptionParser.new do |opts|
      end,
      'cat-file' => OptionParser.new do |opts|
      end,
      'checkout' => OptionParser.new do |opts|
      end,
      'hash-object' => OptionParser.new do |opts|
      end,
      'init' => OptionParser.new do |opts|
      end,
      'log' => OptionParser.new do |opts|
      end,
      'ls-tree' => OptionParser.new do |opts|
      end,
      'merge' => OptionParser.new do |opts|
      end,
      'rebase' => OptionParser.new do |opts|
      end,
      'rev-parse' => OptionParser.new do |opts|
      end,
      'rm' => OptionParser.new do |opts|
      end,
      'show-ref' => OptionParser.new do |opts|
      end,
      'tag' => OptionParser.new do |opts|
      end
    }
  end

  def parse(args)
    args << '--help' if args.empty?

    self.parser.order!(args)
    command = args.shift
    subcommands[command].order!(args) if subcommands.has_key?(subcommands)
  end
end