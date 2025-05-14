class Conveyor < Formula
  desc "Conveyor command line interface"
  homepage "https://www.conveyordata.com/"
  if OS.mac? && Hardware::CPU.intel?
    url "https://static.conveyordata.com/cli/1.18.39/conveyor_darwin_amd64.tar.gz"
    sha256 "c179d37ce5ac8a8c88ef5b25090b27589c461d867cdd11059f538320e5fda229"
  end
  if OS.mac? && Hardware::CPU.arm?
    url "https://static.conveyordata.com/cli/1.18.39/conveyor_darwin_arm64.tar.gz"
    sha256 "0dad2a579d13d362b1d713e3a144e695c7c03aaa0bcf19d69d17da3e505cbd6a"
  end
  if OS.linux? && Hardware::CPU.intel?
    url "https://static.conveyordata.com/cli/1.18.39/conveyor_linux_amd64.tar.gz"
    sha256 "ba66150ebcf27939e303c87f0b69fc1ef76d7b827ff542d78981db4cb0b68504"
  end
  if OS.linux? && Hardware::CPU.arm?
    url "https://static.conveyordata.com/cli/1.18.39/conveyor_linux_arm64.tar.gz"
    sha256 "329a5ce22492d0f13103cfdd278bd268fa06ec0eb3d3a0780a73c46439cc65a3"
  end
  version "1.18.39"

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
