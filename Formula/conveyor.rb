class Conveyor < Formula
  desc "Conveyor command line interface"
  homepage "https://www.conveyordata.com/"
  if OS.mac? && Hardware::CPU.intel?
    url "https://static.conveyordata.com/cli/1.19.12/conveyor_darwin_amd64.tar.gz"
    sha256 "7d56cfa7790cfcb3edeb8f2657142759964775d2be805dfb4c88451f8f5317c5"
  end
  if OS.mac? && Hardware::CPU.arm?
    url "https://static.conveyordata.com/cli/1.19.12/conveyor_darwin_arm64.tar.gz"
    sha256 "dab0b993f0193443617ee8e021ea5e9b4be2e79f387f1094abf69e1a9cf486fd"
  end
  if OS.linux? && Hardware::CPU.intel?
    url "https://static.conveyordata.com/cli/1.19.12/conveyor_linux_amd64.tar.gz"
    sha256 "53b769df752b10bcb5e915b14432d01f83e5c77077f88b4c44d4767f87644013"
  end
  if OS.linux? && Hardware::CPU.arm?
    url "https://static.conveyordata.com/cli/1.19.12/conveyor_linux_arm64.tar.gz"
    sha256 "57b2f8ca606774ff0d94deaaa7f8d9408bf2073551cafe8c02bee28d9ece59c7"
  end
  version "1.19.12"

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
