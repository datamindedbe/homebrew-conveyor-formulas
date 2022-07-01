class Conveyor < Formula
  desc "Conveyor command line interface"
  homepage "https://www.conveyordata.com/"
  if OS.mac? && Hardware::CPU.intel?
    url "https://datafy-cp-artifacts.s3-eu-west-1.amazonaws.com/cli/1.3.4/conveyor_darwin_amd64.tar.gz"
    sha256 "df5cc11071f6f531a99e1b3f6ed779e8db2859755b3a367ba9895b9b5556dbb9"
  end
  if OS.mac? && Hardware::CPU.arm?
    url "https://datafy-cp-artifacts.s3-eu-west-1.amazonaws.com/cli/1.3.4/conveyor_darwin_arm64.tar.gz"
    sha256 "45444a7ecf77a6e162bc0debe3d124c7b95c5c728ffd707773d83ad80e15353e"
  end
  if OS.linux? && Hardware::CPU.intel?
    url "https://datafy-cp-artifacts.s3-eu-west-1.amazonaws.com/cli/1.3.4/conveyor_linux_amd64.tar.gz"
    sha256 "10d0d3e0f3cf609f65e841cc1649cb113f3487f87d79ce8d38ac59dd578f2c16"
  end
  version "1.3.4"

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
