class Conveyor < Formula
  desc "Conveyor command line interface"
  homepage "https://www.conveyordata.com/"
  if OS.mac? && Hardware::CPU.intel?
    url "https://static.conveyordata.com/cli/1.20.15/conveyor_darwin_amd64.tar.gz"
    sha256 "d32611ddf3fef075cac5c0785cf5a6d87d93e193ddf74b5a7193d606ef2663a2"
  end
  if OS.mac? && Hardware::CPU.arm?
    url "https://static.conveyordata.com/cli/1.20.15/conveyor_darwin_arm64.tar.gz"
    sha256 "9239f7796befdd56960ee52012698b24907b7de0ce3afd55d759ca677af4b8de"
  end
  if OS.linux? && Hardware::CPU.intel?
    url "https://static.conveyordata.com/cli/1.20.15/conveyor_linux_amd64.tar.gz"
    sha256 "87018a5e80c4dc7a7c4752401b096f42682dca3acc3b280eadc74f85757229d6"
  end
  if OS.linux? && Hardware::CPU.arm?
    url "https://static.conveyordata.com/cli/1.20.15/conveyor_linux_arm64.tar.gz"
    sha256 "e1cd59954c91f0cc6285e84daf0753ec3d96ad49e0d13515d7e9b03cb911fad8"
  end
  version "1.20.15"

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
