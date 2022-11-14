class Conveyor < Formula
  desc "Conveyor command line interface"
  homepage "https://www.conveyordata.com/"
  if OS.mac? && Hardware::CPU.intel?
    url "https://static.conveyordata.com/cli/1.5.10/conveyor_darwin_amd64.tar.gz"
    sha256 "5590a80f92b00c11c1f0778f50114be6435828ee760a0f3cbe1892bbfaf883d1"
  end
  if OS.mac? && Hardware::CPU.arm?
    url "https://static.conveyordata.com/cli/1.5.10/conveyor_darwin_arm64.tar.gz"
    sha256 "0cfa4897bc527fcf3e6289529bc468c754d34e0dce600e925375c0acfc8d422e"
  end
  if OS.linux? && Hardware::CPU.intel?
    url "https://static.conveyordata.com/cli/1.5.10/conveyor_linux_amd64.tar.gz"
    sha256 "b179b75b6a96bf4513b73a5d4ef23c2d323d6c00f8e5b9d3b2f182c762c54f0d"
  end
  version "1.5.10"

  def install
    bin.install Dir.glob("**/conveyor")
    cp bin/"conveyor", bin/"datafy"

    # Install bash completion
    output = Utils.safe_popen_read("#{bin}/conveyor", "completion", "bash", { :err => :out })
    (bash_completion/"conveyor").write output
    (bash_completion/"datafy").write output

    # Install zsh completion
    output = Utils.safe_popen_read("#{bin}/conveyor", "completion", "zsh", { :err => :out })
    (zsh_completion/"_conveyor").write output
    (zsh_completion/"_datafy").write output

    # Install fish completion
    output = Utils.safe_popen_read("#{bin}/conveyor", "completion", "fish", { :err => :out })
    (fish_completion/"conveyor.fish").write output
    (zsh_completion/"datafy.fish").write output
  end

  test do
    system "#{bin}/conveyor", "--help"
  end
end
