class Datafy < Formula
  desc "Datafy command line interface"
  homepage "https://get.datafy.cloud/"
  on_macos do
    url "https://datafy-cp-artifacts.s3-eu-west-1.amazonaws.com/cli/0.43.0/datafy_darwin_amd64.tar.gz"
    sha256 "316c62aa568c0a0a20684e7f009380bc69939d4d267828836f50a1a93f38a1a2"
  end
  on_linux do
    url "https://datafy-cp-artifacts.s3-eu-west-1.amazonaws.com/cli/0.43.0/datafy_linux_amd64.tar.gz"
    sha256 "059bc99d04c7a3c338e5e57e1ad44b21592a6dcf061dfc949b375ed8cc5f0297"
  end
  version "0.43.0"

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