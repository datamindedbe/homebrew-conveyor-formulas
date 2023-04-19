class Conveyor < Formula
  desc "Conveyor command line interface"
  homepage "https://www.conveyordata.com/"
  if OS.mac? && Hardware::CPU.intel?
    url "https://static.conveyordata.com/cli/1.10.7/conveyor_darwin_amd64.tar.gz"
    sha256 "8922030ad953256a4bd3e8e596cf0ecd2eb426526ca519f6ffc71bdf4aeb5b37"
  end
  if OS.mac? && Hardware::CPU.arm?
    url "https://static.conveyordata.com/cli/1.10.7/conveyor_darwin_arm64.tar.gz"
    sha256 "6c713421c2f9a46fe0f0c0f4eb6839cbb4cdb850d95749ac163d035e2b337029"
  end
  if OS.linux? && Hardware::CPU.intel?
    url "https://static.conveyordata.com/cli/1.10.7/conveyor_linux_amd64.tar.gz"
    sha256 "bbc082ad2d09c4e48bfcaa2c2254ed7cb5e5a35c93f48af61cdff75c27374688"
  end
  version "1.10.7"

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
