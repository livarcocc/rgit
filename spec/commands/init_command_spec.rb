require_relative '../../app/commands/init_command'

RSpec.describe InitCommand, "#InitCommand" do
  expectedHelp = <<INIT_HELP
Usage: rgit init [options]

    -p, --path PATH                  Path to the directory where the git repository will be created
    -h, --help                       Show help
INIT_HELP

  context "Parse" do
    it "sets the path when --path is passed as an argument to the parser" do
      initCommand = InitCommand.new(:nil)
      initCommand.parse(["--path", "repo_root"])

      expect(initCommand.path).to eq("repo_root")
    end

    it "fails when --path is passed without an argument to the parser" do
      initCommand = InitCommand.new(:nil)
      expect { initCommand.parse(["--path"]) }
        .to raise_error(OptionParser::MissingArgument, "missing argument: --path")
    end

    it "returns help content" do
      initCommand = InitCommand.new(:nil)
      expect(initCommand.help).to eq(expectedHelp)
    end

    it "shows the help output" do
      initCommand = InitCommand.new(:nil)
      expect { initCommand.parse(["--help"]) }.to output(expectedHelp).to_stdout
    end
  end

  context "Execute" do
    it "creates a git repo" do
      gitRepository = double('git_repository')
      expect(gitRepository).to receive(:create).with(nil)
      initCommand = InitCommand.new(gitRepository)

      initCommand.execute
    end

    it "creates a git repo in the specified location" do
      gitRepository = double('git_repository')
      expect(gitRepository).to receive(:create).with("expected_path")
      initCommand = InitCommand.new(gitRepository)

      initCommand.path = "expected_path"
      initCommand.execute
    end
  end
end