class Datafy < Formula
  desc "Datafy command line interface"
  homepage "https://get.datafy.cloud/"
  if OS.mac? && Hardware::CPU.intel?
    url "https://datafy-cp-artifacts.s3-eu-west-1.amazonaws.com/cli/0.62.1/datafy_darwin_amd64.tar.gz"
    sha256 "908903a8eb3a1ce2bf60fe17c86bf798a5b9c1d34fb9d79e6d97cb2dd7c9d933"
  end
  if OS.mac? && Hardware::CPU.arm?
    url "https://datafy-cp-artifacts.s3-eu-west-1.amazonaws.com/cli/0.62.1/datafy_darwin_arm64.tar.gz"
    sha256 "a1964ddc1f33ffc4a7ca8dda38ce9c9bd060b817b88a9bb512fcbb0e3776924c"
  end
  if OS.linux? && Hardware::CPU.intel?
    url "https://datafy-cp-artifacts.s3-eu-west-1.amazonaws.com/cli/0.62.1/datafy_linux_amd64.tar.gz"
    sha256 "c5aa1696cfe5bb0b7dc8cc3b399fcaaa3f232d8ebcda9b659d106f9279ac9c63"
  end
  version "0.62.1"

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
