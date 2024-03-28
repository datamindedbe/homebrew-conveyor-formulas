class Conveyor < Formula
  desc "Conveyor command line interface"
  homepage "https://www.conveyordata.com/"
  if OS.mac? && Hardware::CPU.intel?
    url "https://static.conveyordata.com/cli/1.15.3/conveyor_darwin_amd64.tar.gz"
    sha256 "f3571568399124f6ac5ef6e84ed08845eb3127f700269bb5c38b7311b083afbc"
  end
  if OS.mac? && Hardware::CPU.arm?
    url "https://static.conveyordata.com/cli/1.15.3/conveyor_darwin_arm64.tar.gz"
    sha256 "1c26bc31fcede1c07a8a9a733e05d3987a90d9b097ce39b2d796e969e8d370a7"
  end
  if OS.linux? && Hardware::CPU.intel?
    url "https://static.conveyordata.com/cli/1.15.3/conveyor_linux_amd64.tar.gz"
    sha256 "fcfd072372ed57aa8ca411c0457a3e8b66dd18fb4dac1938f35d41e6c1a95d30"
  end
  if OS.linux? && Hardware::CPU.arm?
    url "https://static.conveyordata.com/cli/1.15.3/conveyor_linux_arm64.tar.gz"
    sha256 "b7b59900c37b943d378fb72a38a99e5658d17f0785845f18c1b17ea4577bff9f"
  end
  version "1.15.3"

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
