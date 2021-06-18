class Datafy < Formula
  desc "Datafy command line interface"
  homepage "https://get.datafy.cloud/"
  on_macos do
    url "https://datafy-cp-artifacts.s3-eu-west-1.amazonaws.com/cli/0.49.1/datafy_darwin_amd64.tar.gz"
    sha256 "5316a7658af85887e5ae76540f31acc44757a3aed278e40f0c486867c0d736ec"
  end
  on_linux do
    url "https://datafy-cp-artifacts.s3-eu-west-1.amazonaws.com/cli/0.49.1/datafy_linux_amd64.tar.gz"
    sha256 "2facd8532b284db465b88d1cdd5d255f4fe0e783e38c0eca0e4b3bb4d8cb77be"
  end
  version "0.49.1"

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