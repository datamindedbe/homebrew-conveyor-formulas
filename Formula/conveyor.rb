class Conveyor < Formula
  desc "Conveyor command line interface"
  homepage "https://www.conveyordata.com/"
  if OS.mac? && Hardware::CPU.intel?
    url "https://static.conveyordata.com/cli/1.18.15/conveyor_darwin_amd64.tar.gz"
    sha256 "6551b0e294a3693cbfc2db7112b1025dbf8624fd9b4180156a428abf3bee31c4"
  end
  if OS.mac? && Hardware::CPU.arm?
    url "https://static.conveyordata.com/cli/1.18.15/conveyor_darwin_arm64.tar.gz"
    sha256 "c333afa861c668b1f9b2e14b0c939fc3faeb5c27a1f9a7205ff75c4cbd4aa28a"
  end
  if OS.linux? && Hardware::CPU.intel?
    url "https://static.conveyordata.com/cli/1.18.15/conveyor_linux_amd64.tar.gz"
    sha256 "031a1906670f3e2b29fd8c2bbe35df83b93e88c641cd5ef8fc1d49c6c3080c4b"
  end
  if OS.linux? && Hardware::CPU.arm?
    url "https://static.conveyordata.com/cli/1.18.15/conveyor_linux_arm64.tar.gz"
    sha256 "0a5d4dc15d1400fbc92ffb0feefcff7e7a0bd95133ac85d6a4799d18e5e3ba13"
  end
  version "1.18.15"

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
