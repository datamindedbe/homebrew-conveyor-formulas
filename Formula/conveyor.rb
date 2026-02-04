class Conveyor < Formula
  desc "Conveyor command line interface"
  homepage "https://www.conveyordata.com/"
  if OS.mac? && Hardware::CPU.intel?
    url "https://static.conveyordata.com/cli/1.20.10/conveyor_darwin_amd64.tar.gz"
    sha256 "68d54f40127e5ded232bb4b3a4392dd2776f72783f5d3cce69a1c75b3650bb22"
  end
  if OS.mac? && Hardware::CPU.arm?
    url "https://static.conveyordata.com/cli/1.20.10/conveyor_darwin_arm64.tar.gz"
    sha256 "4bfb19b286da1a34dbb6a154840fd29d3477ff55deb35e5ff45ba7c703074fa6"
  end
  if OS.linux? && Hardware::CPU.intel?
    url "https://static.conveyordata.com/cli/1.20.10/conveyor_linux_amd64.tar.gz"
    sha256 "38d6048b908fe0fb1eb4f1226dfe582e0cb7b797752500dc873abad84f25fe2a"
  end
  if OS.linux? && Hardware::CPU.arm?
    url "https://static.conveyordata.com/cli/1.20.10/conveyor_linux_arm64.tar.gz"
    sha256 "c716b76db37d42213d3d6cc8abc0e5c74657270879a74e46d062499b0abbaa4b"
  end
  version "1.20.10"

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
