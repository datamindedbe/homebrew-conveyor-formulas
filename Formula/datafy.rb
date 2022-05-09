class Datafy < Formula
  desc "Datafy command line interface"
  homepage "https://get.datafy.cloud/"
  if OS.mac? && Hardware::CPU.intel?
    url "https://datafy-cp-artifacts.s3-eu-west-1.amazonaws.com/cli/0.63.2/datafy_darwin_amd64.tar.gz"
    sha256 "629b7118f3f566574372805d8bd0c6b5093f4a263fbe90ce8477ea991eca7aaf"
  end
  if OS.mac? && Hardware::CPU.arm?
    url "https://datafy-cp-artifacts.s3-eu-west-1.amazonaws.com/cli/0.63.2/datafy_darwin_arm64.tar.gz"
    sha256 "a20eeaee44571a2160d642fe0c5e6381410d71d7aef853069ec4dfb00a44d6b1"
  end
  if OS.linux? && Hardware::CPU.intel?
    url "https://datafy-cp-artifacts.s3-eu-west-1.amazonaws.com/cli/0.63.2/datafy_linux_amd64.tar.gz"
    sha256 "ae3e6731725de0952390ee7752832a9b5cd06c0d7893ca539fb03edb99f4fb02"
  end
  version "0.63.2"

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
