class Datafy < Formula
  desc "Datafy command line interface"
  homepage "https://get.datafy.cloud/"
  on_macos do
    url "https://datafy-cp-artifacts.s3-eu-west-1.amazonaws.com/cli/0.50.2/datafy_darwin_amd64.tar.gz"
    sha256 "9280fa8a1ae7781cead11a809eeb68525678587f042ac51ad028cdeee60afcdb"
  end
  on_linux do
    url "https://datafy-cp-artifacts.s3-eu-west-1.amazonaws.com/cli/0.50.2/datafy_linux_amd64.tar.gz"
    sha256 "5ed7d74f5e94e8c3b849c8c585ea2acb686a63eafe0117412f323cd359c7253f"
  end
  version "0.50.2"

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