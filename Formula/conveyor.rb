class Conveyor < Formula
  desc "Conveyor command line interface"
  homepage "https://www.conveyordata.com/"
  if OS.mac? && Hardware::CPU.intel?
    url "https://static.conveyordata.com/cli/1.11.18/conveyor_darwin_amd64.tar.gz"
    sha256 "cc989193501a2f35ed5c3ed2665de146596ec9cef4d96ac5141e2e6cb0c13c0a"
  end
  if OS.mac? && Hardware::CPU.arm?
    url "https://static.conveyordata.com/cli/1.11.18/conveyor_darwin_arm64.tar.gz"
    sha256 "bc1ba6ef9d119b1ba488348e98b799dfac2ba8f14fd4f3d2e7fb2aa0b5bb90e3"
  end
  if OS.linux? && Hardware::CPU.intel?
    url "https://static.conveyordata.com/cli/1.11.18/conveyor_linux_amd64.tar.gz"
    sha256 "fd48baac6e811d7bbb8e40ea3f52ba64486e8376f3dba35ef5a7ccd8da82cff3"
  end
  version "1.11.18"

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
