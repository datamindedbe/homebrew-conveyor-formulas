class Conveyor < Formula
  desc "Conveyor command line interface"
  homepage "https://www.conveyordata.com/"
  if OS.mac? && Hardware::CPU.intel?
    url "https://static.conveyordata.com/cli/1.22.6/conveyor_darwin_amd64.tar.gz"
    sha256 "d3f63800b52c0fed793f7ab1827d212bcca11346f54e488b0bfabaccacc69052"
  end
  if OS.mac? && Hardware::CPU.arm?
    url "https://static.conveyordata.com/cli/1.22.6/conveyor_darwin_arm64.tar.gz"
    sha256 "f7bea818baaa4a3e4cbf70e79492d3f77417c3735a6274890fa37cae13f6cdc7"
  end
  if OS.linux? && Hardware::CPU.intel?
    url "https://static.conveyordata.com/cli/1.22.6/conveyor_linux_amd64.tar.gz"
    sha256 "d424be8fbbe9cc4b1a0b3490335f147a19871b1598461ce80e6d2cf8d418c001"
  end
  if OS.linux? && Hardware::CPU.arm?
    url "https://static.conveyordata.com/cli/1.22.6/conveyor_linux_arm64.tar.gz"
    sha256 "4c3d5515f54fa316ffbcbe4f6e409838727c8fce535ba6a371854b16deb022dc"
  end
  version "1.22.6"

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
