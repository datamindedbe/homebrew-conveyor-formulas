class Datafy < Formula
  desc "Datafy command line interface"
  homepage "https://get.datafy.cloud/"
  on_macos do
    url "https://datafy-cp-artifacts.s3-eu-west-1.amazonaws.com/cli/0.44.3/datafy_darwin_amd64.tar.gz"
    sha256 "317556b87b1308dd9b624e968013a067b8a27e49c058543a893a8de18a3b3d2c"
  end
  on_linux do
    url "https://datafy-cp-artifacts.s3-eu-west-1.amazonaws.com/cli/0.44.3/datafy_linux_amd64.tar.gz"
    sha256 "66a8ee743bcabe8b2ac75bb4d87332f2849a43f208e41eba501fc9657697e8df"
  end
  version "0.44.3"

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