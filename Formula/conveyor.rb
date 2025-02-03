class Conveyor < Formula
  desc "Conveyor command line interface"
  homepage "https://www.conveyordata.com/"
  if OS.mac? && Hardware::CPU.intel?
    url "https://static.conveyordata.com/cli/1.18.27/conveyor_darwin_amd64.tar.gz"
    sha256 "10b6d770e313511cf8367d2f8aa427e558a41c8299cc27880881ef49d13f796a"
  end
  if OS.mac? && Hardware::CPU.arm?
    url "https://static.conveyordata.com/cli/1.18.27/conveyor_darwin_arm64.tar.gz"
    sha256 "8980bd3a8c33c24d79fab0a4a240d5c74cbdc654c1c65eb725e2f441e1fb002f"
  end
  if OS.linux? && Hardware::CPU.intel?
    url "https://static.conveyordata.com/cli/1.18.27/conveyor_linux_amd64.tar.gz"
    sha256 "086888d27b233a610a47efc82ac1cdd53390a71a78e509c8d82e10257c069794"
  end
  if OS.linux? && Hardware::CPU.arm?
    url "https://static.conveyordata.com/cli/1.18.27/conveyor_linux_arm64.tar.gz"
    sha256 "0652b028e4a2594d808cf83305a73e1f9258713ac9ff4ac7e9d322301c5b152f"
  end
  version "1.18.27"

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
