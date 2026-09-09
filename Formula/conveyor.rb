class Conveyor < Formula
  desc "Conveyor command line interface"
  homepage "https://www.conveyordata.com/"
  if OS.mac? && Hardware::CPU.intel?
    url "https://static.conveyordata.com/cli/1.23.0/conveyor_darwin_amd64.tar.gz"
    sha256 "c96732aad5b9f2ae46240fc68a5100d6d0a78bbd1aacce5db672b082dd77e56b"
  end
  if OS.mac? && Hardware::CPU.arm?
    url "https://static.conveyordata.com/cli/1.23.0/conveyor_darwin_arm64.tar.gz"
    sha256 "89e8161c521de9d103c111dc66d35f04476b74941d12d70c2a2d7030d35944b2"
  end
  if OS.linux? && Hardware::CPU.intel?
    url "https://static.conveyordata.com/cli/1.23.0/conveyor_linux_amd64.tar.gz"
    sha256 "5e976a2ab31054a9de24b0e5a08fd6d75b2d931f2f06e1a6cc4b5e6b2deca004"
  end
  if OS.linux? && Hardware::CPU.arm?
    url "https://static.conveyordata.com/cli/1.23.0/conveyor_linux_arm64.tar.gz"
    sha256 "2a924c09fd157dab9ca86014f2106cae929f39216df1d7b8d59059a811010028"
  end
  version "1.23.0"

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
