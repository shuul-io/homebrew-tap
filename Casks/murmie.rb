cask "murmie" do
  # version and sha256 are updated by scripts/release.sh in the Murmie app repo
  version "1.0.0"
  sha256 "342b0e8829d3f4619cf1e0d2d8e5514b44e58b02f2cc9f92cd9f22e6ea17fd7b"

  url "https://github.com/shuul-io/murmie-releases/releases/download/v#{version}/Murmie.dmg",
      verified: "github.com/shuul-io/murmie-releases/"
  name "Murmie"
  desc "Private, on-device voice dictation"
  homepage "https://murmie.com/"

  # The update feed lists short version and build number ("1.0.0,1"); the cask only needs the short version
  livecheck do
    url "https://murmie.com/appcast.xml"
    strategy :sparkle, &:short_version
  end

  # Murmie updates itself with Sparkle, so `brew upgrade` skips it unless --greedy is given
  auto_updates true
  depends_on arch: :arm64
  depends_on macos: :tahoe

  app "Murmie.app"

  # Quit the running app before it is removed or replaced
  uninstall quit: "com.murmie.app"

  # `brew uninstall --zap` removes Murmie's settings, caches and the models in its own folder. It leaves the
  # Whisper models (~/Documents/huggingface) and the Parakeet models (~/Library/Application Support/FluidAudio),
  # which other apps can share, and the Keychain items. The privacy policy explains how to delete those.
  zap trash: [
    "~/Library/Application Support/Murmie",
    "~/Library/Caches/com.murmie.app",
    "~/Library/Preferences/com.murmie.app.plist",
  ]
end
