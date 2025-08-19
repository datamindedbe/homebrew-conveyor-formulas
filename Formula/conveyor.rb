class Conveyor < Formula
  desc "Conveyor command line interface"
  homepage "https://www.conveyordata.com/"
  if OS.mac? && Hardware::CPU.intel?
    url "https://static.conveyordata.com/cli/1.19.8/conveyor_darwin_amd64.tar.gz"
    sha256 "8108df9e8fc30ce62b87c0b71023986e492bb62d3b3755af3de3e6a2ea80c6f7"
  end
  if OS.mac? && Hardware::CPU.arm?
    url "https://static.conveyordata.com/cli/1.19.8/conveyor_darwin_arm64.tar.gz"
    sha256 "b665860707b651fa2188603bd68c93f33c77d6c271e9ffe6dcba549b714b9101"
  end
  if OS.linux? && Hardware::CPU.intel?
    url "https://static.conveyordata.com/cli/1.19.8/conveyor_linux_amd64.tar.gz"
    sha256 "113c50ec7278f3af68dd5058f77af5bba37914270b5d4859cbaf1b644cde2a9f"
  end
  if OS.linux? && Hardware::CPU.arm?
    url "https://static.conveyordata.com/cli/1.19.8/conveyor_linux_arm64.tar.gz"
    sha256 "687ef55f1028748babd88fb2a9b59a7a148618cd82dba8d9a05c590f1c4d058f"
  end
  version "1.19.8"

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
