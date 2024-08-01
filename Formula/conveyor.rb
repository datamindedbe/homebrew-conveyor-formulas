class Conveyor < Formula
  desc "Conveyor command line interface"
  homepage "https://www.conveyordata.com/"
  if OS.mac? && Hardware::CPU.intel?
    url "https://static.conveyordata.com/cli/1.17.8/conveyor_darwin_amd64.tar.gz"
    sha256 "c3b57f236e21353af559aa3001da1ec22660d7064a186922474d629c0dc83f5b"
  end
  if OS.mac? && Hardware::CPU.arm?
    url "https://static.conveyordata.com/cli/1.17.8/conveyor_darwin_arm64.tar.gz"
    sha256 "c7d602238fc693ef688a992cdee11d5a3c75852447540d10f01db8420e8063a1"
  end
  if OS.linux? && Hardware::CPU.intel?
    url "https://static.conveyordata.com/cli/1.17.8/conveyor_linux_amd64.tar.gz"
    sha256 "883ee9e02a756e72d9dec290dd056077fecd101477c1042cd143231930d42568"
  end
  if OS.linux? && Hardware::CPU.arm?
    url "https://static.conveyordata.com/cli/1.17.8/conveyor_linux_arm64.tar.gz"
    sha256 "3e5595cf66eab75b93872c385e8e36a3abcf8840cb4d5311a88d239eb26018e6"
  end
  version "1.17.8"

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
