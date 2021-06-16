class Datafy < Formula
  desc "Datafy command line interface"
  homepage "https://get.datafy.cloud/"
  on_macos do
    url "https://datafy-cp-artifacts.s3-eu-west-1.amazonaws.com/cli/0.48.1/datafy_darwin_amd64.tar.gz"
    sha256 "3eac8f930c0b2d819cf954a1bbbba94db74f94f93674829ef275dbc059190d91"
  end
  on_linux do
    url "https://datafy-cp-artifacts.s3-eu-west-1.amazonaws.com/cli/0.48.1/datafy_linux_amd64.tar.gz"
    sha256 "da474e839cafddeaf700a07f162fae19ef2f33051d5d8bff1ef7bd6e49e8e694"
  end
  version "0.48.1"

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