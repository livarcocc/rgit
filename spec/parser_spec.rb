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

  context "with no paramaters" do
    it "shows the help output" do
      parser = RGitParser.new({})
      expect { parser.parse([]) }.to output("#{USAGE}\n\n#{MAIN_HELP}").to_stdout
    end
  end

  # add a test to cover we do nice errors for missing parameters: https://stackoverflow.com/questions/1541294/how-do-you-specify-a-required-switch-not-argument-with-ruby-optionparser
end