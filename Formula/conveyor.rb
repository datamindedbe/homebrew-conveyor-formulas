class Conveyor < Formula
  desc "Conveyor command line interface"
  homepage "https://www.conveyordata.com/"
  if OS.mac? && Hardware::CPU.intel?
    url "https://static.conveyordata.com/cli/1.18.37/conveyor_darwin_amd64.tar.gz"
    sha256 "22ce3977dfd25b469064418a3e67e634132e41b97ae5a49efb4c671288281efa"
  end
  if OS.mac? && Hardware::CPU.arm?
    url "https://static.conveyordata.com/cli/1.18.37/conveyor_darwin_arm64.tar.gz"
    sha256 "4452d7b70801c4cc2c7e2edca9754c68f0b4953d911cdd9c4ce07d3dc953d9f9"
  end
  if OS.linux? && Hardware::CPU.intel?
    url "https://static.conveyordata.com/cli/1.18.37/conveyor_linux_amd64.tar.gz"
    sha256 "6dd2775b910cd8799162b7f5c45840c8cde31e56386b441f594722a6b86f0725"
  end
  if OS.linux? && Hardware::CPU.arm?
    url "https://static.conveyordata.com/cli/1.18.37/conveyor_linux_arm64.tar.gz"
    sha256 "89cf0ee9012fa00d9e66026d2370edf7cb5b6445d1cf14ec26c70870792a2842"
  end
  version "1.18.37"

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
