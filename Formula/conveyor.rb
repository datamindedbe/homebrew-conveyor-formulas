class Conveyor < Formula
  desc "Conveyor command line interface"
  homepage "https://www.conveyordata.com/"
  if OS.mac? && Hardware::CPU.intel?
    url "https://static.conveyordata.com/cli/1.20.3/conveyor_darwin_amd64.tar.gz"
    sha256 "41ff1995e5f720096c4aaae93b919849f58ca8014102c6de48591671d1c552de"
  end
  if OS.mac? && Hardware::CPU.arm?
    url "https://static.conveyordata.com/cli/1.20.3/conveyor_darwin_arm64.tar.gz"
    sha256 "75b12848c623d51c4013dcca4be014216d261befc3fc5d4ed2ab5e3df9aeebbf"
  end
  if OS.linux? && Hardware::CPU.intel?
    url "https://static.conveyordata.com/cli/1.20.3/conveyor_linux_amd64.tar.gz"
    sha256 "147db7a66fd2bab5f6d84cc582eb2c0e4e426c97ea8808cb71e8ba2ed697de5b"
  end
  if OS.linux? && Hardware::CPU.arm?
    url "https://static.conveyordata.com/cli/1.20.3/conveyor_linux_arm64.tar.gz"
    sha256 "6bde77f0b615f605a0d35992f167bef29e5b67f6d8a8d08f41ca7bb554a99ed4"
  end
  version "1.20.3"

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
