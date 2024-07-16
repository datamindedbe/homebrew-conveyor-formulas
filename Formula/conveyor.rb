class Conveyor < Formula
  desc "Conveyor command line interface"
  homepage "https://www.conveyordata.com/"
  if OS.mac? && Hardware::CPU.intel?
    url "https://static.conveyordata.com/cli/1.17.3/conveyor_darwin_amd64.tar.gz"
    sha256 "168f992c6e9eec9a7e53edbb821b4f01e1687f1dc3884f67dce5a15db946e44f"
  end
  if OS.mac? && Hardware::CPU.arm?
    url "https://static.conveyordata.com/cli/1.17.3/conveyor_darwin_arm64.tar.gz"
    sha256 "6d8fb0a2c3f6922fe7450ad37e993866d262b6c09db5f282a232409454dc3924"
  end
  if OS.linux? && Hardware::CPU.intel?
    url "https://static.conveyordata.com/cli/1.17.3/conveyor_linux_amd64.tar.gz"
    sha256 "febe04002538f0372dc123f01c6a33b5403152a78bf08269799ce5e31e3f6682"
  end
  if OS.linux? && Hardware::CPU.arm?
    url "https://static.conveyordata.com/cli/1.17.3/conveyor_linux_arm64.tar.gz"
    sha256 "5a73bb8b801980d91596e1291904cb031158c9d06253a963cd7c12fa38e485e9"
  end
  version "1.17.3"

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
