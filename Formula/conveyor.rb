class Conveyor < Formula
  desc "Conveyor command line interface"
  homepage "https://www.conveyordata.com/"
  if OS.mac? && Hardware::CPU.intel?
    url "https://static.conveyordata.com/cli/1.18.4/conveyor_darwin_amd64.tar.gz"
    sha256 "4e1e627228bb5dd651f5405d059975479955ecfca075b7532d9d854953530adc"
  end
  if OS.mac? && Hardware::CPU.arm?
    url "https://static.conveyordata.com/cli/1.18.4/conveyor_darwin_arm64.tar.gz"
    sha256 "42281a619e02d041c0d95094d21e20cae619dc893f7ab35875a34d5d9876f673"
  end
  if OS.linux? && Hardware::CPU.intel?
    url "https://static.conveyordata.com/cli/1.18.4/conveyor_linux_amd64.tar.gz"
    sha256 "cdc8065f404b90831e9145954ca0bea62c8031ddd2831e52fcd3a447c11ad5a2"
  end
  if OS.linux? && Hardware::CPU.arm?
    url "https://static.conveyordata.com/cli/1.18.4/conveyor_linux_arm64.tar.gz"
    sha256 "7b12c0ef502d3b96fe6ea00c0cdaa552fbd80a6a5fd1c8dcf331e2ce1d886505"
  end
  version "1.18.4"

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
