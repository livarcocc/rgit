require_relative '../app/parser'
require_relative '../app/strings'

RSpec.describe RGitParser, "#Parse" do
  context "with command" do
    it "returns a init command when 'init' is passed" do
      initCommand = double('init_command')
      expect(initCommand).to receive(:parse)
      subcommands = {
        'init' => initCommand
      }

      parser = RGitParser.new(subcommands)
      command = parser.parse(["init"])
    end
  end

  context "with missing arguments" do
    it "displays a graceful error message" do
      expected = <<EXPECTED
missing argument: arg

general help for missing command
EXPECTED

      initCommand = double('init_command')
      expect(initCommand).to receive(:help).and_return("general help for missing command")
      expect(initCommand).to receive(:parse).and_raise(OptionParser::MissingArgument.new("arg"))
      subcommands = {
        'init' => initCommand
      }

      parser = RGitParser.new(subcommands)
      expect { parser.parse(["init"]) }.to output(expected).to_stdout
    end
  end

  context "with no paramaters" do
    it "shows the help output" do
      expected = <<EXPECTED
Usage: rgit COMMAND [options]

Available commands:
    add:
    cat-file:
    checkout:
    commmit:
    hash-object:
    init:
    log:
    ls-tree:
    merge:
    rebase:
    rev-parse:
    rm:
    show-ref:
    tag:

    -h, --help                       Show help
EXPECTED

      parser = RGitParser.new({})
      expect { parser.parse([]) }.to output(expected).to_stdout
    end
  end
end