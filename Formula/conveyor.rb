class Conveyor < Formula
  desc "Conveyor command line interface"
  homepage "https://www.conveyordata.com/"
  if OS.mac? && Hardware::CPU.intel?
    url "https://static.conveyordata.com/cli/1.8.7/conveyor_darwin_amd64.tar.gz"
    sha256 "97c257d68991757da5b6c901c8983ef886088d96254bc8716408584d9dac9d26"
  end
  if OS.mac? && Hardware::CPU.arm?
    url "https://static.conveyordata.com/cli/1.8.7/conveyor_darwin_arm64.tar.gz"
    sha256 "bb6c534486cfdf14c1e1c0584f60dcbaa81f0cd0523fd0073c8d9ac6328b6c04"
  end
  if OS.linux? && Hardware::CPU.intel?
    url "https://static.conveyordata.com/cli/1.8.7/conveyor_linux_amd64.tar.gz"
    sha256 "2c7d50d5274f7d65a3b684c698268bfccd2f2a68f2a4fbba1a1f06e15a57bb81"
  end
  version "1.8.7"

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
