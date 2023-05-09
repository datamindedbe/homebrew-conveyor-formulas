class Conveyor < Formula
  desc "Conveyor command line interface"
  homepage "https://www.conveyordata.com/"
  if OS.mac? && Hardware::CPU.intel?
    url "https://static.conveyordata.com/cli/1.10.11/conveyor_darwin_amd64.tar.gz"
    sha256 "92e6635f9550b223ff02ea6b4c5a31fd999fe8d06e2ff0a22f760a5b44fb12ec"
  end
  if OS.mac? && Hardware::CPU.arm?
    url "https://static.conveyordata.com/cli/1.10.11/conveyor_darwin_arm64.tar.gz"
    sha256 "9dba1dd4cbe16bf8dd72e7226be3661eb12823abd64d151a9e5878e26fc633f3"
  end
  if OS.linux? && Hardware::CPU.intel?
    url "https://static.conveyordata.com/cli/1.10.11/conveyor_linux_amd64.tar.gz"
    sha256 "bc0d725bf5c320bd3ca1584562df36b9abe466e569fb90ed297bf08944c449d6"
  end
  version "1.10.11"

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
