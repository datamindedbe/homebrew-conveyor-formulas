class Conveyor < Formula
  desc "Conveyor command line interface"
  homepage "https://www.conveyordata.com/"
  if OS.mac? && Hardware::CPU.intel?
    url "https://static.conveyordata.com/cli/1.20.11/conveyor_darwin_amd64.tar.gz"
    sha256 "d65b493184219c096489aba7d5f5675f1eeec5e4ce8a10c7c726428d07210e27"
  end
  if OS.mac? && Hardware::CPU.arm?
    url "https://static.conveyordata.com/cli/1.20.11/conveyor_darwin_arm64.tar.gz"
    sha256 "8af547cfb765a467aaaca556df38eebdbee85055c843b0725afbb898c8f8b212"
  end
  if OS.linux? && Hardware::CPU.intel?
    url "https://static.conveyordata.com/cli/1.20.11/conveyor_linux_amd64.tar.gz"
    sha256 "8acffa828624daf63ef0f93fa514beda3c1b699ec532950f32ff157a8158124c"
  end
  if OS.linux? && Hardware::CPU.arm?
    url "https://static.conveyordata.com/cli/1.20.11/conveyor_linux_arm64.tar.gz"
    sha256 "d2398eddb143073ecb74f58de26f81117a8ace11f78287186fd220c98c06c4da"
  end
  version "1.20.11"

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
