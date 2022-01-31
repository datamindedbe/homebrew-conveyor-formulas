class Datafy < Formula
  desc "Datafy command line interface"
  homepage "https://get.datafy.cloud/"
  if OS.mac? && Hardware::CPU.intel?
    url "https://datafy-cp-artifacts.s3-eu-west-1.amazonaws.com/cli/0.59.0/datafy_darwin_amd64.tar.gz"
    sha256 "4454787a9fef52bb701002ac21f7a952b0b01fd2217892bead2aafb5c826c2a9"
  end
  if OS.mac? && Hardware::CPU.arm?
    url "https://datafy-cp-artifacts.s3-eu-west-1.amazonaws.com/cli/0.59.0/datafy_darwin_arm64.tar.gz"
    sha256 "19f72330da7612d181ba8d1ad1ebc23ca9e2b37de02f712aaf9a7bbce92680d5"
  end
  if OS.linux? && Hardware::CPU.intel?
    url "https://datafy-cp-artifacts.s3-eu-west-1.amazonaws.com/cli/0.59.0/datafy_linux_amd64.tar.gz"
    sha256 "cce6a2b682664d979dda0c663d992970069ec0cf278963700183e742ac5df0db"
  end
  version "0.59.0"

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
