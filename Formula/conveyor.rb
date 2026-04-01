class Conveyor < Formula
  desc "Conveyor command line interface"
  homepage "https://www.conveyordata.com/"
  if OS.mac? && Hardware::CPU.intel?
    url "https://static.conveyordata.com/cli/1.21.1/conveyor_darwin_amd64.tar.gz"
    sha256 "bacfd1026ae469925178d7547b5f420256b0251ffe51ad285b6b1e9883a58ad7"
  end
  if OS.mac? && Hardware::CPU.arm?
    url "https://static.conveyordata.com/cli/1.21.1/conveyor_darwin_arm64.tar.gz"
    sha256 "4d7a48a82ea3c6e918c2db1ca22fd048b237675e1b1f106b7c5f0fb7057531ba"
  end
  if OS.linux? && Hardware::CPU.intel?
    url "https://static.conveyordata.com/cli/1.21.1/conveyor_linux_amd64.tar.gz"
    sha256 "f6ec17dc658efb0b0f3e84a54d30001660742c8d093b43380e2a8092dce09fb2"
  end
  if OS.linux? && Hardware::CPU.arm?
    url "https://static.conveyordata.com/cli/1.21.1/conveyor_linux_arm64.tar.gz"
    sha256 "4ed996332b89a1fc18c1b0f6dbf6630cdc34c9dfb58e7761ab52b358ef37a8b7"
  end
  version "1.21.1"

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
