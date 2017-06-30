class Scalingo < Formula
  desc "Command-line tool for the scalingo hosting service"
  homepage "http://cli.scalingo.com/"
  url "https://github.com/Scalingo/cli/archive/1.5.0.tar.gz"
  sha256 "4a81cbbf8363f40db85914ed25bf3d7c7c0a5947ef0ef65418f4eb781ff0eade"
  head "https://github.com/Scalingo/cli.git"

  bottle do
    cellar :any_skip_relocation
  end

  test do
    system "scalingo", "-v"
  end

  depends_on "go" => :build

  def install
    ENV["GOPATH"] = buildpath
    dir = buildpath/"src/github.com/Scalingo/cli"
    dir.install buildpath.children
    cd dir do
      system "go", "get", "./..."
      system "go", "install", "github.com/Scalingo/cli/scalingo"
    end
    bin.install "bin/scalingo"
  end
end
