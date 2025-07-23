class Conveyor < Formula
  desc "Conveyor command line interface"
  homepage "https://www.conveyordata.com/"
  if OS.mac? && Hardware::CPU.intel?
    url "https://static.conveyordata.com/cli/1.19.3/conveyor_darwin_amd64.tar.gz"
    sha256 "d374b07b8f5dab88861688eded69720c4a1cb8f02b2d904675541241af8027d3"
  end
  if OS.mac? && Hardware::CPU.arm?
    url "https://static.conveyordata.com/cli/1.19.3/conveyor_darwin_arm64.tar.gz"
    sha256 "60568b61197a9e9aac6a1dd6d3eca52ec3932377a6655971b6d4358274a93a82"
  end
  if OS.linux? && Hardware::CPU.intel?
    url "https://static.conveyordata.com/cli/1.19.3/conveyor_linux_amd64.tar.gz"
    sha256 "0ebe640a8f5097d27a9844677437095775418e38bb908caba0c9fa2a26817c7e"
  end
  if OS.linux? && Hardware::CPU.arm?
    url "https://static.conveyordata.com/cli/1.19.3/conveyor_linux_arm64.tar.gz"
    sha256 "9faf22eaeec5856a4f28fa5d1c9bdce78822702b59080a72feb1581f5949a771"
  end
  version "1.19.3"

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
