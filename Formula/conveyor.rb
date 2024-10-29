class Conveyor < Formula
  desc "Conveyor command line interface"
  homepage "https://www.conveyordata.com/"
  if OS.mac? && Hardware::CPU.intel?
    url "https://static.conveyordata.com/cli/1.18.12/conveyor_darwin_amd64.tar.gz"
    sha256 "1257fba26135e3bb5023e26f226814216b3d9f8bba39608ce8374da6e256aade"
  end
  if OS.mac? && Hardware::CPU.arm?
    url "https://static.conveyordata.com/cli/1.18.12/conveyor_darwin_arm64.tar.gz"
    sha256 "064e551d509bf99cb5a18cbdc100bdf24e86f632cab175c83124b01baa52ec40"
  end
  if OS.linux? && Hardware::CPU.intel?
    url "https://static.conveyordata.com/cli/1.18.12/conveyor_linux_amd64.tar.gz"
    sha256 "c3fba88c36b9ebb525a90dcf3edb57ca4c81609901b51bb8a102f9c59bc7d7de"
  end
  if OS.linux? && Hardware::CPU.arm?
    url "https://static.conveyordata.com/cli/1.18.12/conveyor_linux_arm64.tar.gz"
    sha256 "b97c609d2b96d05651a12fb294c687041d06abd22c85028f7a0e1292f443da66"
  end
  version "1.18.12"

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
