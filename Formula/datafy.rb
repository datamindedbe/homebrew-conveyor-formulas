class Datafy < Formula
  desc "Datafy command line interface"
  homepage "https://get.datafy.cloud/"
  on_macos do
    url "https://datafy-cp-artifacts.s3-eu-west-1.amazonaws.com/cli/0.46.1/datafy_darwin_amd64.tar.gz"
    sha256 "75a510202af4247c5fe75aa05c7d9c11ca94f64ce4d4b19c810bae2e25e578b9"
  end
  on_linux do
    url "https://datafy-cp-artifacts.s3-eu-west-1.amazonaws.com/cli/0.46.1/datafy_linux_amd64.tar.gz"
    sha256 "77f631754f4701dbed0f40dd542a6c14e6e03d0ef7a9aa63c0a54c1e3fa37fd1"
  end
  version "0.46.1"

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