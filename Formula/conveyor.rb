class Conveyor < Formula
  desc "Conveyor command line interface"
  homepage "https://www.conveyordata.com/"
  if OS.mac? && Hardware::CPU.intel?
    url "https://static.conveyordata.com/cli/1.8.3/conveyor_darwin_amd64.tar.gz"
    sha256 "72ef6b8ba90dc8337b1b6d9272c419202e46ab2845f8389b0d1c0e3b02a0cd06"
  end
  if OS.mac? && Hardware::CPU.arm?
    url "https://static.conveyordata.com/cli/1.8.3/conveyor_darwin_arm64.tar.gz"
    sha256 "1aa79d04b14087c9f5687fca377b28f23d5951f66e4916dab0774a9badbe4dad"
  end
  if OS.linux? && Hardware::CPU.intel?
    url "https://static.conveyordata.com/cli/1.8.3/conveyor_linux_amd64.tar.gz"
    sha256 "01a0e2680ec923bcfbbeebf2f2992bec0b20f3c517132cb1788fe20ba4268727"
  end
  version "1.8.3"

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
