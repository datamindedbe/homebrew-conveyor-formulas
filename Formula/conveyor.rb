class Conveyor < Formula
  desc "Conveyor command line interface"
  homepage "https://www.conveyordata.com/"
  if OS.mac? && Hardware::CPU.intel?
    url "https://static.conveyordata.com/cli/1.18.40/conveyor_darwin_amd64.tar.gz"
    sha256 "d1ff408b17e688f6e20bb88176d399da635cb61183de6ef4ffeec4a28f2baa05"
  end
  if OS.mac? && Hardware::CPU.arm?
    url "https://static.conveyordata.com/cli/1.18.40/conveyor_darwin_arm64.tar.gz"
    sha256 "74b59f149e83da438b2b9d6ba488ff3e8b42104551a58b03c125b9fe65572a93"
  end
  if OS.linux? && Hardware::CPU.intel?
    url "https://static.conveyordata.com/cli/1.18.40/conveyor_linux_amd64.tar.gz"
    sha256 "50dbf3737648b72580b701c4114e8939ac56d12d77f9535e78677d32a776af50"
  end
  if OS.linux? && Hardware::CPU.arm?
    url "https://static.conveyordata.com/cli/1.18.40/conveyor_linux_arm64.tar.gz"
    sha256 "33993082c2143017d4fd1bc580ec47bdd681f14cbcc4cded65c20f871d14fbdc"
  end
  version "1.18.40"

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
