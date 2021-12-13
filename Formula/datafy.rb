class Datafy < Formula
  desc "Datafy command line interface"
  homepage "https://get.datafy.cloud/"
  if OS.mac? && Hardware::CPU.intel?
    url "https://datafy-cp-artifacts.s3-eu-west-1.amazonaws.com/cli/0.56.4/datafy_darwin_amd64.tar.gz"
    sha256 "e6f6ef22c0091614e02f422b894a943d16a78d6fa39c49c8b73f53b199d7db60"
  end
  if OS.mac? && Hardware::CPU.arm?
    url "https://datafy-cp-artifacts.s3-eu-west-1.amazonaws.com/cli/0.56.4/datafy_darwin_arm64.tar.gz"
    sha256 "8107f5d9bc2ac2d0210d069cddbb18003f00106abfb6e9fe907e323a87df2a2b"
  end
  if OS.linux? && Hardware::CPU.intel?
    url "https://datafy-cp-artifacts.s3-eu-west-1.amazonaws.com/cli/0.56.4/datafy_linux_amd64.tar.gz"
    sha256 "a63db2ab7533fdae5757a14949c7fbedbf6996da19958f6a67af23a477b7770e"
  end
  version "0.56.4"

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

  test do
    system "#{bin}/datafy", "--help"
  end
end
