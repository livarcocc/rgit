require_relative '../strings'

class InitCommand
  attr_accessor :path

  def parse(args)
    OptionParser.new do |opts|
      opts.banner = INIT_USAGE
      opts.separator ""

      opts.on("-p", "--path PATH",
              "Path to the directory where the git repository will be created") do |path|
        @path = path
      end

      opts.on_tail("-h", "--help", HELP_DESCRIPTION) do
        puts opts
        exit
      end
    end.parse!(args)
  end

  def execute
  end
end