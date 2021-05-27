class Datafy < Formula
  desc "Datafy command line interface"
  homepage "https://get.datafy.cloud/"
  on_macos do
    url "https://datafy-cp-artifacts.s3-eu-west-1.amazonaws.com/cli/0.46.2/datafy_darwin_amd64.tar.gz"
    sha256 "605de17dfb25cb0f21dd5e09ce08d0e8c8cb6f554ec28ec88e7bb049ff57d4e6"
  end
  on_linux do
    url "https://datafy-cp-artifacts.s3-eu-west-1.amazonaws.com/cli/0.46.2/datafy_linux_amd64.tar.gz"
    sha256 "b3646b078b8beaa66d6b2731b12e13514d127bb6874e39dcd9bb4e34f5adb27d"
  end
  version "0.46.2"

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