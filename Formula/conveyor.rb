class Conveyor < Formula
  desc "Conveyor command line interface"
  homepage "https://www.conveyordata.com/"
  if OS.mac? && Hardware::CPU.intel?
    url "https://static.conveyordata.com/cli/1.23.6/conveyor_darwin_amd64.tar.gz"
    sha256 "eddde20a11407949357a8cbdf2a2047e29ef96edb828585a9f889d9adba26a26"
  end
  if OS.mac? && Hardware::CPU.arm?
    url "https://static.conveyordata.com/cli/1.23.6/conveyor_darwin_arm64.tar.gz"
    sha256 "f4fce6411394ed8f24d2ff4f3289b66d1c8a047446df7791fca1b1e9af6b9588"
  end
  if OS.linux? && Hardware::CPU.intel?
    url "https://static.conveyordata.com/cli/1.23.6/conveyor_linux_amd64.tar.gz"
    sha256 "05c567abdc4ce5477228c30a41fc3dadd590314574a406bf555b8f56e56b0743"
  end
  if OS.linux? && Hardware::CPU.arm?
    url "https://static.conveyordata.com/cli/1.23.6/conveyor_linux_arm64.tar.gz"
    sha256 "205ddf5da7f521ff1e041518d2f34d3aa6ecdac77cd22044c030402b6a1b2477"
  end
  version "1.23.6"

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
