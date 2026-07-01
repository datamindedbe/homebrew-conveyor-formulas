class Conveyor < Formula
  desc "Conveyor command line interface"
  homepage "https://www.conveyordata.com/"
  if OS.mac? && Hardware::CPU.intel?
    url "https://static.conveyordata.com/cli/1.22.8/conveyor_darwin_amd64.tar.gz"
    sha256 "34b502c591f936f54a909d746b3ef23be0edd7928d4dc22a678db053c041daa3"
  end
  if OS.mac? && Hardware::CPU.arm?
    url "https://static.conveyordata.com/cli/1.22.8/conveyor_darwin_arm64.tar.gz"
    sha256 "3ca28b040d5d8ce966b1c050abe8cc8778c663f086e95abf7fea66b04b8844f5"
  end
  if OS.linux? && Hardware::CPU.intel?
    url "https://static.conveyordata.com/cli/1.22.8/conveyor_linux_amd64.tar.gz"
    sha256 "f9c0a01916fe26690ad649a051a37d684682624367592ec7cf4f011e4113bafe"
  end
  if OS.linux? && Hardware::CPU.arm?
    url "https://static.conveyordata.com/cli/1.22.8/conveyor_linux_arm64.tar.gz"
    sha256 "7cfa0c9b2901f32e58dae98a40bb8457a35f7772a5f895001ffa1542aebbd83a"
  end
  version "1.22.8"

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
