class Conveyor < Formula
  desc "Conveyor command line interface"
  homepage "https://www.conveyordata.com/"
  if OS.mac? && Hardware::CPU.intel?
    url "https://static.conveyordata.com/cli/1.22.13/conveyor_darwin_amd64.tar.gz"
    sha256 "34d74b4a094dcf06d234f192610e6f650731a13fc4805a3458d524a5c087ea80"
  end
  if OS.mac? && Hardware::CPU.arm?
    url "https://static.conveyordata.com/cli/1.22.13/conveyor_darwin_arm64.tar.gz"
    sha256 "30d7395754bbe8df3ab98aa1807bfb2bda115c21dba257a32eb2bed7b71f66b6"
  end
  if OS.linux? && Hardware::CPU.intel?
    url "https://static.conveyordata.com/cli/1.22.13/conveyor_linux_amd64.tar.gz"
    sha256 "66e998d995ed6422fb46f94f61488f3e876a8d385929f886fd5ff8c458663abe"
  end
  if OS.linux? && Hardware::CPU.arm?
    url "https://static.conveyordata.com/cli/1.22.13/conveyor_linux_arm64.tar.gz"
    sha256 "af6ccda022a608af72330f66533c5098ae6155e31c2e6cb357b550ceb0183c81"
  end
  version "1.22.13"

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
