class Conveyor < Formula
  desc "Conveyor command line interface"
  homepage "https://www.conveyordata.com/"
  if OS.mac? && Hardware::CPU.intel?
    url "https://static.conveyordata.com/cli/1.11.22/conveyor_darwin_amd64.tar.gz"
    sha256 "6a9ed352c265c8db4a6252e3dd2fc5ad8ce1a3ce51b89930ca0e53d022fc8bce"
  end
  if OS.mac? && Hardware::CPU.arm?
    url "https://static.conveyordata.com/cli/1.11.22/conveyor_darwin_arm64.tar.gz"
    sha256 "322462ade468504ded8285a45970257209e6b4328095cbd8ecd67057ccc460a1"
  end
  if OS.linux? && Hardware::CPU.intel?
    url "https://static.conveyordata.com/cli/1.11.22/conveyor_linux_amd64.tar.gz"
    sha256 "fc50942f7482504fbd3571b3bf79c3eb21962dca6d78d6a381104fd118f4e59e"
  end
  if OS.linux? && Hardware::CPU.arm?
    url "https://static.conveyordata.com/cli/1.11.22/conveyor_linux_arm64.tar.gz"
    sha256 "2b81d03f58ae4bb8ba6d273ce7cdc0bcee45034b40351921e0fc885d456fe586"
  end
  version "1.11.22"

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
