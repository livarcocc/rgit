require_relative '../strings'

class InitCommand
  attr_accessor :path

  def initialize
    @parser = OptionParser.new do |opts|
      opts.banner = INIT_USAGE
      opts.separator ""

      opts.on("-p", "--path PATH",
              "Path to the directory where the git repository will be created") do |path|
        @path = path
      end

      opts.on_tail("-h", "--help", HELP_DESCRIPTION) do
        puts opts
      end
    end
  end

  def parse(args)
    @parser.parse!(args)
  end

  #not happy that this class has two responsabilities: parsing and executing
  def execute
  end

  def help
    @parser.to_s
  end
end