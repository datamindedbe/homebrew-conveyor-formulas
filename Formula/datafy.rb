class Datafy < Formula
  desc "Datafy command line interface"
  homepage "https://get.datafy.cloud/"
  if OS.mac? && Hardware::CPU.intel?
    url "https://datafy-cp-artifacts.s3-eu-west-1.amazonaws.com/cli/0.58.1/datafy_darwin_amd64.tar.gz"
    sha256 "238f71cc9c081f1cc1d491f670d7d282c9215285b371950c5e67c68b5e5eeb86"
  end
  if OS.mac? && Hardware::CPU.arm?
    url "https://datafy-cp-artifacts.s3-eu-west-1.amazonaws.com/cli/0.58.1/datafy_darwin_arm64.tar.gz"
    sha256 "6e7e674eb26ebd922520ef8d1f9993d4ff8460835812cce586c8bcc62307ae2a"
  end
  if OS.linux? && Hardware::CPU.intel?
    url "https://datafy-cp-artifacts.s3-eu-west-1.amazonaws.com/cli/0.58.1/datafy_linux_amd64.tar.gz"
    sha256 "3d9367f33504cd2052dc7150dc3fd813bc57c1c52942e8863cc442c8991a5da3"
  end
  version "0.58.1"

  def install
    bin.install Dir.glob("**/datafy")

    # Install bash completion
    output = Utils.safe_popen_read("#{bin}/datafy", "completion", "bash", { :err => :out })
    (bash_completion/"datafy").write output

    # Install zsh completion
    output = Utils.safe_popen_read("#{bin}/datafy", "completion", "zsh", { :err => :out })
    (zsh_completion/"_datafy").write output

    # Install fish completion
    output = Utils.safe_popen_read("#{bin}/datafy", "completion", "fish", { :err => :out })
    (fish_completion/"datafy.fish").write output
  end

  test do
    system "#{bin}/datafy", "--help"
  end
end
