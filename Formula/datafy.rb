class Datafy < Formula
  desc "Datafy command line interface"
  homepage "https://get.datafy.cloud/"
  on_macos do
    url "https://datafy-cp-artifacts.s3-eu-west-1.amazonaws.com/cli/0.54.1/datafy_darwin_amd64.tar.gz"
    sha256 "c0ca6203064b7430fa2eb80cbc12f21f73884376d65198fabdc3280bdb66939e"
  end
  on_linux do
    url "https://datafy-cp-artifacts.s3-eu-west-1.amazonaws.com/cli/0.54.1/datafy_linux_amd64.tar.gz"
    sha256 "7f4973365e6d3b1cc3a171ccba9013ba65ed019bf6724172954276597a81780d"
  end
  version "0.54.1"

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
