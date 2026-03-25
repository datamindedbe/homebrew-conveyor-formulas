class Conveyor < Formula
  desc "Conveyor command line interface"
  homepage "https://www.conveyordata.com/"
  if OS.mac? && Hardware::CPU.intel?
    url "https://static.conveyordata.com/cli/1.21.0/conveyor_darwin_amd64.tar.gz"
    sha256 "a8c116ca3b20292be2670064d9b096805ce18063745da9c11f6f0d1c927e3fe7"
  end
  if OS.mac? && Hardware::CPU.arm?
    url "https://static.conveyordata.com/cli/1.21.0/conveyor_darwin_arm64.tar.gz"
    sha256 "ad75231661ed791a21c104d1e79073ae107871ff100c8660adaa0039190253d9"
  end
  if OS.linux? && Hardware::CPU.intel?
    url "https://static.conveyordata.com/cli/1.21.0/conveyor_linux_amd64.tar.gz"
    sha256 "d356d59d2033f121b0a0caeb1761bce740106cbe313a243a47f65dcea11f62a7"
  end
  if OS.linux? && Hardware::CPU.arm?
    url "https://static.conveyordata.com/cli/1.21.0/conveyor_linux_arm64.tar.gz"
    sha256 "971d68bb2eabbc95974176463c1e7be603c9ec9f13bfb0d055243282d6764148"
  end
  version "1.21.0"

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
