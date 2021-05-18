class Datafy < Formula
  desc "Datafy command line interface"
  homepage "https://get.datafy.cloud/"
  on_macos do
    url "https://datafy-cp-artifacts.s3-eu-west-1.amazonaws.com/cli/0.45.0/datafy_darwin_amd64.tar.gz"
    sha256 "b3a7f06ab52e32affdc99ffefcf8459dcf2e2fec525ca75e8e2d549f5a5cfca1"
  end
  on_linux do
    url "https://datafy-cp-artifacts.s3-eu-west-1.amazonaws.com/cli/0.45.0/datafy_linux_amd64.tar.gz"
    sha256 "76c681dd29074f3516076d861a96a9e4119da99861cfffd6a01ef0953f71f36d"
  end
  version "0.45.0"

  def install
    bin.install Dir.glob("**/datafy")

    # Install bash completion
    output = Utils.safe_popen_read("#{bin}/datafy", "completion", "bash", { :err => :out })
    (bash_completion/"datafy").write output

    # Install zsh completion
    output = Utils.safe_popen_read("#{bin}/datafy", "completion", "zsh", { :err => :out })
    (zsh_completion/"datafy").write output
  end
end