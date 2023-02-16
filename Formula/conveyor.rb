class Conveyor < Formula
  desc "Conveyor command line interface"
  homepage "https://www.conveyordata.com/"
  if OS.mac? && Hardware::CPU.intel?
    url "https://static.conveyordata.com/cli/1.8.9/conveyor_darwin_amd64.tar.gz"
    sha256 "d8bbd3712b3cb74d16fc42c71dead6f556f8c04b53eba3c8c281796b6d8b9ea3"
  end
  if OS.mac? && Hardware::CPU.arm?
    url "https://static.conveyordata.com/cli/1.8.9/conveyor_darwin_arm64.tar.gz"
    sha256 "e1e0832f21d7a44448d6e39d8a085c162f92cf35b8408811cd066e87bc88e3c5"
  end
  if OS.linux? && Hardware::CPU.intel?
    url "https://static.conveyordata.com/cli/1.8.9/conveyor_linux_amd64.tar.gz"
    sha256 "a2afa8f93e039a87bc7f044b0a96df4c010ccd8ddab080dc42f9355b736b1ee7"
  end
  version "1.8.9"

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
