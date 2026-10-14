class Conveyor < Formula
  desc "Conveyor command line interface"
  homepage "https://www.conveyordata.com/"
  if OS.mac? && Hardware::CPU.intel?
    url "https://static.conveyordata.com/cli/1.23.5/conveyor_darwin_amd64.tar.gz"
    sha256 "453b97f99a2c01c6c5e96d122c33272caa855ed88a4baaa246041170bcec77f8"
  end
  if OS.mac? && Hardware::CPU.arm?
    url "https://static.conveyordata.com/cli/1.23.5/conveyor_darwin_arm64.tar.gz"
    sha256 "89955d744ba50f5bb600e55d87186b834b1f985d0ede54034f847e349fa20d0e"
  end
  if OS.linux? && Hardware::CPU.intel?
    url "https://static.conveyordata.com/cli/1.23.5/conveyor_linux_amd64.tar.gz"
    sha256 "95b6fc85b2e14af67ea8baff44bed52baeab0b5952df02d086e846c81e38db86"
  end
  if OS.linux? && Hardware::CPU.arm?
    url "https://static.conveyordata.com/cli/1.23.5/conveyor_linux_arm64.tar.gz"
    sha256 "e90117ce3cc054f5e2306eff540e6eadbbbbd20f2fd019b67cf41a0f2880e3ee"
  end
  version "1.23.5"

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
