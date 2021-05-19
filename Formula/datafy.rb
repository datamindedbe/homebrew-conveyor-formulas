class Datafy < Formula
  desc "Datafy command line interface"
  homepage "https://get.datafy.cloud/"
  on_macos do
    url "https://datafy-cp-artifacts.s3-eu-west-1.amazonaws.com/cli/0.45.1/datafy_darwin_amd64.tar.gz"
    sha256 "e0c37c522017a7b56d89056179d7574cf4223626191449326bc3d3aaa854f79b"
  end
  on_linux do
    url "https://datafy-cp-artifacts.s3-eu-west-1.amazonaws.com/cli/0.45.1/datafy_linux_amd64.tar.gz"
    sha256 "d0da5db91d1626ef94a44afc041adc3afa3a7dbeca33679724bef646ff07e16c"
  end
  version "0.45.1"

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