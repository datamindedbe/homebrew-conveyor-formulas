class Conveyor < Formula
  desc "Conveyor command line interface"
  homepage "https://www.conveyordata.com/"
  if OS.mac? && Hardware::CPU.intel?
    url "https://static.conveyordata.com/cli/1.14.8/conveyor_darwin_amd64.tar.gz"
    sha256 "3789b7734331179afb518f0f7ee795a935d6651843211279cd7d091369e3643f"
  end
  if OS.mac? && Hardware::CPU.arm?
    url "https://static.conveyordata.com/cli/1.14.8/conveyor_darwin_arm64.tar.gz"
    sha256 "005769b05a1758c24dc78f297ad32749c94966f24c217d5404c21f0b54a0aee2"
  end
  if OS.linux? && Hardware::CPU.intel?
    url "https://static.conveyordata.com/cli/1.14.8/conveyor_linux_amd64.tar.gz"
    sha256 "5977c6b1ae308887655d12ae200510059306c28ee7e0e89aa57dc5d2818aee3d"
  end
  if OS.linux? && Hardware::CPU.arm?
    url "https://static.conveyordata.com/cli/1.14.8/conveyor_linux_arm64.tar.gz"
    sha256 "d1079dcf767a609ef32b8f5068a0ce7563e0d50e10e898fed27822a0bfe70175"
  end
  version "1.14.8"

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
