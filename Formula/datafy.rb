class Datafy < Formula
  desc "Datafy command line interface"
  homepage "https://get.datafy.cloud/"
  if OS.mac? && Hardware::CPU.intel?
    url "https://datafy-cp-artifacts.s3-eu-west-1.amazonaws.com/cli/0.62.3/datafy_darwin_amd64.tar.gz"
    sha256 "34a370ad26a9805832562cad173cb795e75b35979092b437863eee4f65bb1d4f"
  end
  if OS.mac? && Hardware::CPU.arm?
    url "https://datafy-cp-artifacts.s3-eu-west-1.amazonaws.com/cli/0.62.3/datafy_darwin_arm64.tar.gz"
    sha256 "88dd414c98e93b588a8983ce315d25a2e8ca6bf700e7ef9b7fec261bc2c57a74"
  end
  if OS.linux? && Hardware::CPU.intel?
    url "https://datafy-cp-artifacts.s3-eu-west-1.amazonaws.com/cli/0.62.3/datafy_linux_amd64.tar.gz"
    sha256 "0aecaa7ac2c01ce8fe0cb5a99c9d294cb0d68eae211b744d62aee5ac26f2c275"
  end
  version "0.62.3"

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
