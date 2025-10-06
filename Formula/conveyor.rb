class Conveyor < Formula
  desc "Conveyor command line interface"
  homepage "https://www.conveyordata.com/"
  if OS.mac? && Hardware::CPU.intel?
    url "https://static.conveyordata.com/cli/1.20.0/conveyor_darwin_amd64.tar.gz"
    sha256 "d0e56bb587a2e04678da0cde55b6b816e6772b8f81c106e04b84b5792f4a9f00"
  end
  if OS.mac? && Hardware::CPU.arm?
    url "https://static.conveyordata.com/cli/1.20.0/conveyor_darwin_arm64.tar.gz"
    sha256 "81ee8f14d48d330fe5279115fead7fa0eadc8597f2639a1bad2422f9f73c8735"
  end
  if OS.linux? && Hardware::CPU.intel?
    url "https://static.conveyordata.com/cli/1.20.0/conveyor_linux_amd64.tar.gz"
    sha256 "00966e4018ca747ac6baa301ca27328e4a7de084a49552b515055fcf486a0237"
  end
  if OS.linux? && Hardware::CPU.arm?
    url "https://static.conveyordata.com/cli/1.20.0/conveyor_linux_arm64.tar.gz"
    sha256 "ae4ec06864fa1ae3074ad2112493466592e6e5dc0e18c1784a4b3493f1815665"
  end
  version "1.20.0"

  def install
    bin.install Dir.glob("**/conveyor")
    cp bin/"conveyor", bin/"datafy"

    # Install bash completion
    output = Utils.safe_popen_read(bin/"conveyor", "completion", "bash")
    (bash_completion/"conveyor").write output
    (bash_completion/"datafy").write output

    # Install zsh completion
    output = Utils.safe_popen_read(bin/"conveyor", "completion", "zsh")
    (zsh_completion/"_conveyor").write output
    (zsh_completion/"_datafy").write output

    # Install fish completion
    output = Utils.safe_popen_read(bin/"conveyor", "completion", "fish")
    (fish_completion/"conveyor.fish").write output
    (fish_completion/"datafy.fish").write output
  end

  test do
    system bin/"conveyor", "--help"
  end
end
