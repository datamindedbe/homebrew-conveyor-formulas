class Conveyor < Formula
  desc "Conveyor command line interface"
  homepage "https://www.conveyordata.com/"
  if OS.mac? && Hardware::CPU.intel?
    url "https://static.conveyordata.com/cli/1.10.13/conveyor_darwin_amd64.tar.gz"
    sha256 "2deec389d5b3c1f7ce9732357c040c1f91185e90de48f5125cb172527663cd36"
  end
  if OS.mac? && Hardware::CPU.arm?
    url "https://static.conveyordata.com/cli/1.10.13/conveyor_darwin_arm64.tar.gz"
    sha256 "6af1dee97ab873045ba9bbacd5817735126861158fbead982b81e3dc3d5a8915"
  end
  if OS.linux? && Hardware::CPU.intel?
    url "https://static.conveyordata.com/cli/1.10.13/conveyor_linux_amd64.tar.gz"
    sha256 "f619ac1395617112170f10591a62e3c0a1d300bbdd3dc1a4a7daa576c6c73d25"
  end
  version "1.10.13"

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
