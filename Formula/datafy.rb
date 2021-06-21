class Datafy < Formula
  desc "Datafy command line interface"
  homepage "https://get.datafy.cloud/"
  on_macos do
    url "https://datafy-cp-artifacts.s3-eu-west-1.amazonaws.com/cli/0.49.2/datafy_darwin_amd64.tar.gz"
    sha256 "c87bcc92aa3bf25ef3c2bd845077f38f4a9664b3186cfadfbcbfdb95b214c8b4"
  end
  on_linux do
    url "https://datafy-cp-artifacts.s3-eu-west-1.amazonaws.com/cli/0.49.2/datafy_linux_amd64.tar.gz"
    sha256 "1a652e44592293ed8e7428b2f8ada7f77da5e0fd621fa5510a598003894e2bf8"
  end
  version "0.49.2"

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