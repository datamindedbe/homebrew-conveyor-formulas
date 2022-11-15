class Conveyor < Formula
  desc "Conveyor command line interface"
  homepage "https://www.conveyordata.com/"
  if OS.mac? && Hardware::CPU.intel?
    url "https://static.conveyordata.com/cli/1.5.13/conveyor_darwin_amd64.tar.gz"
    sha256 "22a997ee2ce245c020d0f929709bddd3c29282dcb17fc626e4018fd544f7451d"
  end
  if OS.mac? && Hardware::CPU.arm?
    url "https://static.conveyordata.com/cli/1.5.13/conveyor_darwin_arm64.tar.gz"
    sha256 "b3ed5a5c7e7f6c819af0a848a04509203a018a2da08710ec6ba206a58a36f56d"
  end
  if OS.linux? && Hardware::CPU.intel?
    url "https://static.conveyordata.com/cli/1.5.13/conveyor_linux_amd64.tar.gz"
    sha256 "6d9cb880b632457bf4beb735947cba0f07f588d714f2caaecd6ec7f3b10d2a39"
  end
  version "1.5.13"

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
