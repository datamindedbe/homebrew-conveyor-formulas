class Conveyor < Formula
  desc "Conveyor command line interface"
  homepage "https://www.conveyordata.com/"
  if OS.mac? && Hardware::CPU.intel?
    url "https://static.conveyordata.com/cli/1.22.2/conveyor_darwin_amd64.tar.gz"
    sha256 "35baad02a905939c7049b02cdecc711f191868cbd6b004c2511832437095f1ac"
  end
  if OS.mac? && Hardware::CPU.arm?
    url "https://static.conveyordata.com/cli/1.22.2/conveyor_darwin_arm64.tar.gz"
    sha256 "61d798d9c552d38d9dfb61ccbd4c883dc49f95d265b7fb504fc5968ff330eb92"
  end
  if OS.linux? && Hardware::CPU.intel?
    url "https://static.conveyordata.com/cli/1.22.2/conveyor_linux_amd64.tar.gz"
    sha256 "4fa26c4cfc834413083f27ce6eb71f1ff4abee01855002b45aa9f9cf635e3841"
  end
  if OS.linux? && Hardware::CPU.arm?
    url "https://static.conveyordata.com/cli/1.22.2/conveyor_linux_arm64.tar.gz"
    sha256 "ae132fe05ecaff6c0d70ab4d836b64d0892fe55b4d314a204ec4e5c756953138"
  end
  version "1.22.2"

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
