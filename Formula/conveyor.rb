class Conveyor < Formula
  desc "Conveyor command line interface"
  homepage "https://www.conveyordata.com/"
  if OS.mac? && Hardware::CPU.intel?
    url "https://static.conveyordata.com/cli/1.23.8/conveyor_darwin_amd64.tar.gz"
    sha256 "83c0653e4731abd95aa1b8ff01bc3989faa27e1465768d5c370cc954a46f11ce"
  end
  if OS.mac? && Hardware::CPU.arm?
    url "https://static.conveyordata.com/cli/1.23.8/conveyor_darwin_arm64.tar.gz"
    sha256 "cc1992ab0ad7a6cf9d2c62031aff284fb174fa0c13e5d3a01bd536d6145764b6"
  end
  if OS.linux? && Hardware::CPU.intel?
    url "https://static.conveyordata.com/cli/1.23.8/conveyor_linux_amd64.tar.gz"
    sha256 "7d895bd1b681ab838bd506cb5ba24c6079a2269d59f2ed10751a8602f31210fa"
  end
  if OS.linux? && Hardware::CPU.arm?
    url "https://static.conveyordata.com/cli/1.23.8/conveyor_linux_arm64.tar.gz"
    sha256 "a7f2ba683baf01c8823cf0214fcb6b61273efb1f134f37c99c55201fcc5dd03d"
  end
  version "1.23.8"

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
