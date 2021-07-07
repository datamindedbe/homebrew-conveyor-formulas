class Datafy < Formula
  desc "Datafy command line interface"
  homepage "https://get.datafy.cloud/"
  on_macos do
    url "https://datafy-cp-artifacts.s3-eu-west-1.amazonaws.com/cli/0.50.0/datafy_darwin_amd64.tar.gz"
    sha256 "3ad136b055691d4362afc0b9d25350f69eb2b92538d87f067875e44db67bd59e"
  end
  on_linux do
    url "https://datafy-cp-artifacts.s3-eu-west-1.amazonaws.com/cli/0.50.0/datafy_linux_amd64.tar.gz"
    sha256 "69b32376e1fdc7533979f48ce82903eb086d70d9ab3d7e2eb7e1617a1164f3d2"
  end
  version "0.50.0"

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