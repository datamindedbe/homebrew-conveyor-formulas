class Conveyor < Formula
  desc "Conveyor command line interface"
  homepage "https://www.conveyordata.com/"
  if OS.mac? && Hardware::CPU.intel?
    url "https://static.conveyordata.com/cli/1.22.17/conveyor_darwin_amd64.tar.gz"
    sha256 "e0921a7c0d8b12563793430a6c06da238cc3fcb27fdfe9c6687a54912b87f08f"
  end
  if OS.mac? && Hardware::CPU.arm?
    url "https://static.conveyordata.com/cli/1.22.17/conveyor_darwin_arm64.tar.gz"
    sha256 "14d57e585d2091bf65fd265c43a80346cee08ae0dba5a77fa3237a4b33c47275"
  end
  if OS.linux? && Hardware::CPU.intel?
    url "https://static.conveyordata.com/cli/1.22.17/conveyor_linux_amd64.tar.gz"
    sha256 "46240c8d42ee58c52baf2af763e7be0437982285007f419d038ce23c8ccbdf1a"
  end
  if OS.linux? && Hardware::CPU.arm?
    url "https://static.conveyordata.com/cli/1.22.17/conveyor_linux_arm64.tar.gz"
    sha256 "30bedc0a93962692018145ede49e72abaab14a1dcd85d84168f8a9b8c11230b6"
  end
  version "1.22.17"

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
