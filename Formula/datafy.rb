class Datafy < Formula
  desc "Datafy command line interface"
  homepage "https://get.datafy.cloud/"
  on_macos do
    url "https://datafy-cp-artifacts.s3-eu-west-1.amazonaws.com/cli/0.44.5/datafy_darwin_amd64.tar.gz"
    sha256 "64196486d9246125d102c9d766f1e9bd2e5453e3af37f9edc555cbe5bf4e6c8b"
  end
  on_linux do
    url "https://datafy-cp-artifacts.s3-eu-west-1.amazonaws.com/cli/0.44.5/datafy_linux_amd64.tar.gz"
    sha256 "2f74fe48f17e2ac5f58cbed8259762871e6cb07e064c9f38cab4b63a02474080"
  end
  version "0.44.5"

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