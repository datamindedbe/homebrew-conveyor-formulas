class Conveyor < Formula
  desc "Conveyor command line interface"
  homepage "https://www.conveyordata.com/"
  if OS.mac? && Hardware::CPU.intel?
    url "https://static.conveyordata.com/cli/1.18.43/conveyor_darwin_amd64.tar.gz"
    sha256 "58cb348b8c55fa529393c6f778ce37a0d9d645f8154d39275f5de6fa05026669"
  end
  if OS.mac? && Hardware::CPU.arm?
    url "https://static.conveyordata.com/cli/1.18.43/conveyor_darwin_arm64.tar.gz"
    sha256 "af1685fe4a183591e0f3b47bfea2915259931ca80f7427243541ec0b10a676b9"
  end
  if OS.linux? && Hardware::CPU.intel?
    url "https://static.conveyordata.com/cli/1.18.43/conveyor_linux_amd64.tar.gz"
    sha256 "557c19e66781c4dc7f143b05b4fe25494c16918080ca49887a676096facaa4fa"
  end
  if OS.linux? && Hardware::CPU.arm?
    url "https://static.conveyordata.com/cli/1.18.43/conveyor_linux_arm64.tar.gz"
    sha256 "f27dc480e6addc05f6ec06344b1ed46e080d5105075b193e8713a7a94f15d768"
  end
  version "1.18.43"

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
