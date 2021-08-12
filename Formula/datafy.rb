class Datafy < Formula
  desc "Datafy command line interface"
  homepage "https://get.datafy.cloud/"
  on_macos do
    url "https://datafy-cp-artifacts.s3-eu-west-1.amazonaws.com/cli/0.52.2/datafy_darwin_amd64.tar.gz"
    sha256 "d787a811ceb1d58c3d071539cf806f325b5e72c22597902d00e15278ca17b5f6"
  end
  on_linux do
    url "https://datafy-cp-artifacts.s3-eu-west-1.amazonaws.com/cli/0.52.2/datafy_linux_amd64.tar.gz"
    sha256 "b318eafaca556d6e89a6ed83f5681e1aae5389f718aa10e7be1df685f0116e0f"
  end
  version "0.52.2"

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