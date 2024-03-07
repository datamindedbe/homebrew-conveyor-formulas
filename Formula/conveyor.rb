class Conveyor < Formula
  desc "Conveyor command line interface"
  homepage "https://www.conveyordata.com/"
  if OS.mac? && Hardware::CPU.intel?
    url "https://static.conveyordata.com/cli/1.15.0/conveyor_darwin_amd64.tar.gz"
    sha256 "52da2f577698a80aaac7ea8709b7fce6fe67ac7defe4bdbafc3775e73aa727e6"
  end
  if OS.mac? && Hardware::CPU.arm?
    url "https://static.conveyordata.com/cli/1.15.0/conveyor_darwin_arm64.tar.gz"
    sha256 "e16a944cc4502659ef4c4bdd413cfa0157a66252fdaf318ec7f459e3621f05c8"
  end
  if OS.linux? && Hardware::CPU.intel?
    url "https://static.conveyordata.com/cli/1.15.0/conveyor_linux_amd64.tar.gz"
    sha256 "b25141a782c66a900f026dfe2a649fd163b2f0fe96a9c53fbf6f1d95cb691a96"
  end
  if OS.linux? && Hardware::CPU.arm?
    url "https://static.conveyordata.com/cli/1.15.0/conveyor_linux_arm64.tar.gz"
    sha256 "9167f6402c443cb4f4296831c8372e183b6485578fba1a23d0c48e987770c021"
  end
  version "1.15.0"

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
