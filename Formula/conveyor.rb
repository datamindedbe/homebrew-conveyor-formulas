class Conveyor < Formula
  desc "Conveyor command line interface"
  homepage "https://www.conveyordata.com/"
  if OS.mac? && Hardware::CPU.intel?
    url "https://static.conveyordata.com/cli/1.10.18/conveyor_darwin_amd64.tar.gz"
    sha256 "d4ab00a9dc799e31149131853db3c2c167c296b6455d8a190ffdc2038ba13a47"
  end
  if OS.mac? && Hardware::CPU.arm?
    url "https://static.conveyordata.com/cli/1.10.18/conveyor_darwin_arm64.tar.gz"
    sha256 "46856321d857daa2924e17d0c3c7fa039d6e03d4604609572cbda343f630a0f8"
  end
  if OS.linux? && Hardware::CPU.intel?
    url "https://static.conveyordata.com/cli/1.10.18/conveyor_linux_amd64.tar.gz"
    sha256 "db0cda449487ba65170f9363e2fa4d81379cf658adc945d7d04ebcf0b79e2fde"
  end
  version "1.10.18"

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
