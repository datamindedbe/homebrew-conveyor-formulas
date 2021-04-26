class Datafy < Formula
  desc "Datafy command line interface"
  homepage "https://get.datafy.cloud/"
  on_macos do
    url "https://datafy-cp-artifacts.s3-eu-west-1.amazonaws.com/cli/0.44.0/datafy_darwin_amd64.tar.gz"
    sha256 "48fcedc5143ab163c7a58e2e53eda908b99dfd64091518a299ded38dcc995b0a"
  end
  on_linux do
    url "https://datafy-cp-artifacts.s3-eu-west-1.amazonaws.com/cli/0.44.0/datafy_linux_amd64.tar.gz"
    sha256 "6614dd40620d93161f7dbc6bbfcae18064ad629b2ce6becaf52935dccba39cd4"
  end
  version "0.44.0"

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