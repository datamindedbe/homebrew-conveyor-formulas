class Conveyor < Formula
  desc "Conveyor command line interface"
  homepage "https://www.conveyordata.com/"
  if OS.mac? && Hardware::CPU.intel?
    url "https://static.conveyordata.com/cli/1.22.15/conveyor_darwin_amd64.tar.gz"
    sha256 "012eadf49d1538d0ee6a8f88c2373ea6190d359222c56047588a46f8fbb8d784"
  end
  if OS.mac? && Hardware::CPU.arm?
    url "https://static.conveyordata.com/cli/1.22.15/conveyor_darwin_arm64.tar.gz"
    sha256 "be8361ec457e8c88f812ff1417e66856d4510aebe83d49c259e5fe7deb9e694d"
  end
  if OS.linux? && Hardware::CPU.intel?
    url "https://static.conveyordata.com/cli/1.22.15/conveyor_linux_amd64.tar.gz"
    sha256 "ca6889a2f7d2993fd63e2775fd84925e2c8e530a2c9c10f8c6f559de34659f36"
  end
  if OS.linux? && Hardware::CPU.arm?
    url "https://static.conveyordata.com/cli/1.22.15/conveyor_linux_arm64.tar.gz"
    sha256 "db1de304d159e92d234c78c74d37de8da125dc367bbbaa7d49ce2fd313982c4f"
  end
  version "1.22.15"

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
