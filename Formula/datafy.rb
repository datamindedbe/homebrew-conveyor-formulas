class Datafy < Formula
  desc "Datafy command line interface"
  homepage "https://get.datafy.cloud/"
  on_macos do
    url "https://datafy-cp-artifacts.s3-eu-west-1.amazonaws.com/cli/0.41.0/datafy_darwin_amd64.tar.gz"
    sha256 "8c6688b69bed1e930c86c8f7f006620535c460e000171c24a08bbb1badc51d0f"
  end
  on_linux do
    url "https://datafy-cp-artifacts.s3-eu-west-1.amazonaws.com/cli/0.41.0/datafy_linux_amd64.tar.gz"
    sha256 "76825d7b0f6cdaaa2d1a9bc21efc26be8692acba11e822a8307f0b8b23cd7dcc"
  end
  version "0.41.0"

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