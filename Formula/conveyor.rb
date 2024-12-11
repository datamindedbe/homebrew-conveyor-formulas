class Conveyor < Formula
  desc "Conveyor command line interface"
  homepage "https://www.conveyordata.com/"
  if OS.mac? && Hardware::CPU.intel?
    url "https://static.conveyordata.com/cli/1.18.20/conveyor_darwin_amd64.tar.gz"
    sha256 "52e99d2236b01bfdce447135f65bcf8cad30c293edba2d8c66193303f4626eae"
  end
  if OS.mac? && Hardware::CPU.arm?
    url "https://static.conveyordata.com/cli/1.18.20/conveyor_darwin_arm64.tar.gz"
    sha256 "a09fd3064a415c088a06d4d511d62b3e9f12065b1a1ba8539e5c782d0ae6fd47"
  end
  if OS.linux? && Hardware::CPU.intel?
    url "https://static.conveyordata.com/cli/1.18.20/conveyor_linux_amd64.tar.gz"
    sha256 "5b61ba56b54bd9d55d3279602269dd3ff04813b8d0f4029a2e283000a3a2c01d"
  end
  if OS.linux? && Hardware::CPU.arm?
    url "https://static.conveyordata.com/cli/1.18.20/conveyor_linux_arm64.tar.gz"
    sha256 "b6d28bca98c647b2b144c87214c3fdcddce5b3b0d6c55d29a462fea36795565f"
  end
  version "1.18.20"

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
