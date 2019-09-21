require_relative '../app/parser'
require_relative '../app/strings'

RSpec.describe RGitParser, "#Help" do
  context "with no paramaters" do
    it "shows the help output" do
      parser = RGitParser.new
      expect { parser.parse([]) }.to output("#{USAGE}\n\n#{MAIN_HELP}").to_stdout
    end
  end
end