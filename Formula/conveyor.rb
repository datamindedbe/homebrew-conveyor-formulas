class Conveyor < Formula
  desc "Conveyor command line interface"
  homepage "https://www.conveyordata.com/"
  if OS.mac? && Hardware::CPU.intel?
    url "https://static.conveyordata.com/cli/1.9.0/conveyor_darwin_amd64.tar.gz"
    sha256 "9e17722f93e499b51c0936e2d61289add2b399aa93387716bce328bf0879830e"
  end
  if OS.mac? && Hardware::CPU.arm?
    url "https://static.conveyordata.com/cli/1.9.0/conveyor_darwin_arm64.tar.gz"
    sha256 "57f35a91d767aaf0e2d3cfd956ada2bbe4d539fae1fc267ab2f881509a4a7d3d"
  end
  if OS.linux? && Hardware::CPU.intel?
    url "https://static.conveyordata.com/cli/1.9.0/conveyor_linux_amd64.tar.gz"
    sha256 "8a6916b10050dec4498eebedf47d35f3929c0786d7d0cef947e8a8d0fbad18b3"
  end
  version "1.9.0"

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
