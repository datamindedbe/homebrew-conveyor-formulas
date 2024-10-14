class Conveyor < Formula
  desc "Conveyor command line interface"
  homepage "https://www.conveyordata.com/"
  if OS.mac? && Hardware::CPU.intel?
    url "https://static.conveyordata.com/cli/1.18.9/conveyor_darwin_amd64.tar.gz"
    sha256 "e79704b40c679d3cf6f6976567c79ca85416b1319d4d35412f865d202d814c82"
  end
  if OS.mac? && Hardware::CPU.arm?
    url "https://static.conveyordata.com/cli/1.18.9/conveyor_darwin_arm64.tar.gz"
    sha256 "088904e5dbdb770912d4cb5ea3c5dc8f9b2e93e2456aed8fdaf9e6887d43b0a2"
  end
  if OS.linux? && Hardware::CPU.intel?
    url "https://static.conveyordata.com/cli/1.18.9/conveyor_linux_amd64.tar.gz"
    sha256 "bddf4d9588626ebf31f40886c6d533ba1bdd0c8a9cfc3e193e9e448e30fb7a06"
  end
  if OS.linux? && Hardware::CPU.arm?
    url "https://static.conveyordata.com/cli/1.18.9/conveyor_linux_arm64.tar.gz"
    sha256 "3a0420c687c82539ad20d0c491c97bbc5022b63dfa9728dd7774d916768fa661"
  end
  version "1.18.9"

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
