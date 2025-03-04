class Conveyor < Formula
  desc "Conveyor command line interface"
  homepage "https://www.conveyordata.com/"
  if OS.mac? && Hardware::CPU.intel?
    url "https://static.conveyordata.com/cli/1.18.31/conveyor_darwin_amd64.tar.gz"
    sha256 "df02f74b8e0b5962c5a272aa93cd431da6c3abb645bc5d836ad18d259baa5b0b"
  end
  if OS.mac? && Hardware::CPU.arm?
    url "https://static.conveyordata.com/cli/1.18.31/conveyor_darwin_arm64.tar.gz"
    sha256 "6f1ee246abbb9b8ba701553898914a64990216bbd59d882143fdfdd71bfd4eb5"
  end
  if OS.linux? && Hardware::CPU.intel?
    url "https://static.conveyordata.com/cli/1.18.31/conveyor_linux_amd64.tar.gz"
    sha256 "d669c5d9a773d7632ba06b458fa507ac08f5fcbed1aff3ad0ea7edbb1c5ed472"
  end
  if OS.linux? && Hardware::CPU.arm?
    url "https://static.conveyordata.com/cli/1.18.31/conveyor_linux_arm64.tar.gz"
    sha256 "13efd9aa4fede24ca108aab8d4071d2332de665235b37d807a08c017732b000e"
  end
  version "1.18.31"

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
