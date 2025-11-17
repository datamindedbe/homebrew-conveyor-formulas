class Conveyor < Formula
  desc "Conveyor command line interface"
  homepage "https://www.conveyordata.com/"
  if OS.mac? && Hardware::CPU.intel?
    url "https://static.conveyordata.com/cli/1.20.4/conveyor_darwin_amd64.tar.gz"
    sha256 "562b4a2078a134fa60750adabce0ef47f5f0d76dd07087be343c86957ef71427"
  end
  if OS.mac? && Hardware::CPU.arm?
    url "https://static.conveyordata.com/cli/1.20.4/conveyor_darwin_arm64.tar.gz"
    sha256 "015671865da65c2f75128282580810263da4668bbeaab90d242b57455d8637de"
  end
  if OS.linux? && Hardware::CPU.intel?
    url "https://static.conveyordata.com/cli/1.20.4/conveyor_linux_amd64.tar.gz"
    sha256 "30295c24fb530bf0b535f68970e7ec37e712e237156cffb67238431399c3c2eb"
  end
  if OS.linux? && Hardware::CPU.arm?
    url "https://static.conveyordata.com/cli/1.20.4/conveyor_linux_arm64.tar.gz"
    sha256 "111e32c38f67ee2cc419b0b10f69b3da4ac2e3a4caa6072bde1f38a40765f6ea"
  end
  version "1.20.4"

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
