class Conveyor < Formula
  desc "Conveyor command line interface"
  homepage "https://www.conveyordata.com/"
  if OS.mac? && Hardware::CPU.intel?
    url "https://static.conveyordata.com/cli/1.7.9/conveyor_darwin_amd64.tar.gz"
    sha256 "2d11ddbd98aa27ceb8944f0cbc679178b590446ee650e135dc7596d3daacbbaf"
  end
  if OS.mac? && Hardware::CPU.arm?
    url "https://static.conveyordata.com/cli/1.7.9/conveyor_darwin_arm64.tar.gz"
    sha256 "d0b57b102bbe7cf57ae9cbd8857c9ec1f84664a61dbee2f646e40bfb5f402aad"
  end
  if OS.linux? && Hardware::CPU.intel?
    url "https://static.conveyordata.com/cli/1.7.9/conveyor_linux_amd64.tar.gz"
    sha256 "f586cad504decd6ff1a3955a7db45397192e1697be528aafe90aacd44c50658e"
  end
  version "1.7.9"

  def install
    bin.install Dir.glob("**/conveyor")
    cp bin/"conveyor", bin/"datafy"

    # Install bash completion
    output = Utils.safe_popen_read("#{bin}/conveyor", "completion", "bash", { :err => :out })
    (bash_completion/"conveyor").write output
    (bash_completion/"datafy").write output

    # Install zsh completion
    output = Utils.safe_popen_read("#{bin}/conveyor", "completion", "zsh", { :err => :out })
    (zsh_completion/"_conveyor").write output
    (zsh_completion/"_datafy").write output

    # Install fish completion
    output = Utils.safe_popen_read("#{bin}/conveyor", "completion", "fish", { :err => :out })
    (fish_completion/"conveyor.fish").write output
    (zsh_completion/"datafy.fish").write output
  end

  test do
    system "#{bin}/conveyor", "--help"
  end
end
