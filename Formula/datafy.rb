class Datafy < Formula
  desc "Datafy command line interface"
  homepage "https://get.datafy.cloud/"
  on_macos do
    url "https://datafy-cp-artifacts.s3-eu-west-1.amazonaws.com/cli/0.53.1/datafy_darwin_amd64.tar.gz"
    sha256 "594f913a43550ce60fcb6a7429aaf1b985b3d18bb0c716ca99d826b5bc9efde8"
  end
  on_linux do
    url "https://datafy-cp-artifacts.s3-eu-west-1.amazonaws.com/cli/0.53.1/datafy_linux_amd64.tar.gz"
    sha256 "e449a750e5c262ea2d26ccfac447fd3b39394c93beb0cc45425073ae2329e0b0"
  end
  version "0.53.1"

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
