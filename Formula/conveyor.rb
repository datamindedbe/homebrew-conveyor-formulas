class Conveyor < Formula
  desc "Conveyor command line interface"
  homepage "https://www.conveyordata.com/"
  if OS.mac? && Hardware::CPU.intel?
    url "https://static.conveyordata.com/cli/1.16.3/conveyor_darwin_amd64.tar.gz"
    sha256 "108479fc8d877f8d2c88621966cda1eaa9abfacf2e5905328ee911e8b839a1b0"
  end
  if OS.mac? && Hardware::CPU.arm?
    url "https://static.conveyordata.com/cli/1.16.3/conveyor_darwin_arm64.tar.gz"
    sha256 "bd38e86a663f2e116341be0b11e76ea65f08a7a86b0d771856685edf54fe949c"
  end
  if OS.linux? && Hardware::CPU.intel?
    url "https://static.conveyordata.com/cli/1.16.3/conveyor_linux_amd64.tar.gz"
    sha256 "225a209ad78ddf1363fd70f802aa22293ba6dd79ead96d3c15f883fa834555ad"
  end
  if OS.linux? && Hardware::CPU.arm?
    url "https://static.conveyordata.com/cli/1.16.3/conveyor_linux_arm64.tar.gz"
    sha256 "2ae7b3626c63c0f1db7b1754e58f7cb075349a042601a46fa39ea06cf8c4e2d6"
  end
  version "1.16.3"

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
