require_relative '../../app/commands/init_command'

RSpec.describe InitCommand, "#InitCommand" do
  context "Parsing" do
    it "sets the path when --path is passed as an argument to the parser" do
      initCommand = InitCommand.new
      initCommand.parse(["--path", "repo_root"])

      expect(initCommand.path).to eq("repo_root")
    end

    it "fails when --path is passed without an argument to the parser" do
      initCommand = InitCommand.new
      expect { initCommand.parse(["--path"]) }
        .to raise_error(OptionParser::MissingArgument, "missing argument: --path")
    end
  end
end