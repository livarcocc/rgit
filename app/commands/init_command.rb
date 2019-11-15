require_relative '../strings'

class InitCommand
  attr_accessor :path

  def initialize(gitRepository)
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

    @gitRepository = gitRepository
  end

  def parse(args)
    @parser.parse!(args)
  end

  #not happy that this class has two responsabilities: parsing and executing
  def execute
    @gitRepository.create(@path)
  end

  def help
    @parser.to_s
  end
end