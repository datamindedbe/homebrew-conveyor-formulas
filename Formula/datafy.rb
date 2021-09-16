class Datafy < Formula
  desc "Datafy command line interface"
  homepage "https://get.datafy.cloud/"
  on_macos do
    url "https://datafy-cp-artifacts.s3-eu-west-1.amazonaws.com/cli/0.52.10/datafy_darwin_amd64.tar.gz"
    sha256 "4ea66b03ed1aeb81f16423dc022593b0f1ec8adcf293fe4248a429ca9eb617c0"
  end
  on_linux do
    url "https://datafy-cp-artifacts.s3-eu-west-1.amazonaws.com/cli/0.52.10/datafy_linux_amd64.tar.gz"
    sha256 "c9c7f4bd35e71b722d8509193372b6a389829f74036f10e44d734d20bcc89836"
  end
  version "0.52.10"

  def install
    bin.install Dir.glob("**/datafy")

    # Install bash completion
    output = Utils.safe_popen_read("#{bin}/datafy", "completion", "bash", { :err => :out })
    (bash_completion/"datafy").write output

    # Install zsh completion
    output = Utils.safe_popen_read("#{bin}/datafy", "completion", "zsh", { :err => :out })
    (zsh_completion/"_datafy").write output

    # Install fish completion
    output = Utils.safe_popen_read("#{bin}/datafy", "completion", "fish", { :err => :out })
    (fish_completion/"datafy.fish").write output
  end
end
