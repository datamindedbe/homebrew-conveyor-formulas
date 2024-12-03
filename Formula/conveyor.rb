class Conveyor < Formula
  desc "Conveyor command line interface"
  homepage "https://www.conveyordata.com/"
  if OS.mac? && Hardware::CPU.intel?
    url "https://static.conveyordata.com/cli/1.18.17/conveyor_darwin_amd64.tar.gz"
    sha256 "509a0b2729671374812564920a7fdf43b4bf7b36e23fe8dbe3a028b8fe3ce310"
  end
  if OS.mac? && Hardware::CPU.arm?
    url "https://static.conveyordata.com/cli/1.18.17/conveyor_darwin_arm64.tar.gz"
    sha256 "53140d0dd03069b9ecc570cb2691d0dac346a4a0d17b723616c6a222d2bdd3c6"
  end
  if OS.linux? && Hardware::CPU.intel?
    url "https://static.conveyordata.com/cli/1.18.17/conveyor_linux_amd64.tar.gz"
    sha256 "800e99adcc8f8ea8d196a7a152a3ff8deb379bf437f4f29715d23751010b1628"
  end
  if OS.linux? && Hardware::CPU.arm?
    url "https://static.conveyordata.com/cli/1.18.17/conveyor_linux_arm64.tar.gz"
    sha256 "19b232e4ba16669eee9b4848d04ad46fde7e1a37549572241f786bbbe21d8512"
  end
  version "1.18.17"

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
