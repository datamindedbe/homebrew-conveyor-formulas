class Conveyor < Formula
  desc "Conveyor command line interface"
  homepage "https://www.conveyordata.com/"
  if OS.mac? && Hardware::CPU.intel?
    url "https://static.conveyordata.com/cli/1.7.7/conveyor_darwin_amd64.tar.gz"
    sha256 "f18d78ab86261363991f125e882cd7d0c5aec651362d4e255d083783c4fb01f5"
  end
  if OS.mac? && Hardware::CPU.arm?
    url "https://static.conveyordata.com/cli/1.7.7/conveyor_darwin_arm64.tar.gz"
    sha256 "fe20ec78861e1f1d50933a45aa294a34164fdde04aae1cdb6d7e6c9d853deeb7"
  end
  if OS.linux? && Hardware::CPU.intel?
    url "https://static.conveyordata.com/cli/1.7.7/conveyor_linux_amd64.tar.gz"
    sha256 "a4eea5710c5b29b8a272cd71f3be31d5e5d0ee56233c80b6177347bfc2317f8f"
  end
  version "1.7.7"

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
