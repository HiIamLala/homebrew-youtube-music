require 'json'
require 'net/http'

cask "youtube-music" do
  desc "YouTube Music Desktop App"
  homepage "https://github.com/pear-devs/pear-desktop"

  # Fetch the latest release version from GitHub
  release_url = "https://github.com/pear-devs/pear-desktop"
  releases = "#{release_url}/releases"
  latest_url = "#{releases}/latest"
  response = Net::HTTP.get_response(URI.parse(latest_url))
  latest_url = response['location']
  odie "Cannot find the latest version" if (latest_url.nil?)
  latest_tag   = File.basename(URI.parse(response["location"]).path)

  version :latest

  base_url = "#{releases}/download/#{latest_tag}/YouTube-Music-#{latest_tag.delete_prefix('v')}"
  file_extension = Hardware::CPU.arm? ? "-arm64.dmg" : ".dmg"

  url "#{base_url}#{file_extension}", verified: "github.com/pear-devs/pear-desktop/"

  livecheck do
    url :url
    strategy :github_latest
  end

  # TODO checksum
  sha256 :no_check

  app "YouTube Music.app"

  postflight do
    print("Removing quarantine attribute from YouTube Music.app.\n")
    system "xattr -cr '/Applications/YouTube Music.app'"
  end

  auto_updates true
end
