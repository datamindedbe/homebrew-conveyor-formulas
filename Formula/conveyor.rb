class Conveyor < Formula
  desc "Conveyor command line interface"
  homepage "https://www.conveyordata.com/"
  if OS.mac? && Hardware::CPU.intel?
    url "https://static.conveyordata.com/cli/1.18.19/conveyor_darwin_amd64.tar.gz"
    sha256 "217d51e7a4fcd3e6afcfd7d8bd3febcd067fa9079496e6ede44b5e9b4bb3141a"
  end
  if OS.mac? && Hardware::CPU.arm?
    url "https://static.conveyordata.com/cli/1.18.19/conveyor_darwin_arm64.tar.gz"
    sha256 "0f4288208cf28e50c93a640aaacbded3c167e05314b68c972ef3e085dd473037"
  end
  if OS.linux? && Hardware::CPU.intel?
    url "https://static.conveyordata.com/cli/1.18.19/conveyor_linux_amd64.tar.gz"
    sha256 "cf201e443e5855bb81c35d9e02929250e240979ccf295d476302440d95073de2"
  end
  if OS.linux? && Hardware::CPU.arm?
    url "https://static.conveyordata.com/cli/1.18.19/conveyor_linux_arm64.tar.gz"
    sha256 "a8223d5f65ae90520f6b138c8c51675b3f74b6d187e0a0ef54ffaf6e27166625"
  end
  version "1.18.19"

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
