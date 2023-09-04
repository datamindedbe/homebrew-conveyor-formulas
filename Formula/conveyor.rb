class Conveyor < Formula
  desc "Conveyor command line interface"
  homepage "https://www.conveyordata.com/"
  if OS.mac? && Hardware::CPU.intel?
    url "https://static.conveyordata.com/cli/1.11.11/conveyor_darwin_amd64.tar.gz"
    sha256 "f394fae0e62142cdcef09b46f7914807f72cdcb50073a44f2e73c50ba1df136c"
  end
  if OS.mac? && Hardware::CPU.arm?
    url "https://static.conveyordata.com/cli/1.11.11/conveyor_darwin_arm64.tar.gz"
    sha256 "f001c1359af0b2b7b815076193ce3a8c530ab06f7a5ceb1c12a41f908b06bc36"
  end
  if OS.linux? && Hardware::CPU.intel?
    url "https://static.conveyordata.com/cli/1.11.11/conveyor_linux_amd64.tar.gz"
    sha256 "22f61a62eba23508266b3b162858a98c2518ea5c29ba63865aa3698da5e164d5"
  end
  version "1.11.11"

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
