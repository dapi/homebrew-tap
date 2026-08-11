cask "lidswitch" do
  version "0.7.0"
  sha256 "72153289aab586efc98b949a84889a0c513927b01dfbd470cdd80dc191ad36da"

  url "https://github.com/dapi/LidSwitch/releases/download/v#{version}/LidSwitch-#{version}-macos-arm64.zip"
  name "LidSwitch"
  desc "Control closed-lid work and energy modes from the menu bar"
  homepage "https://pismenny.ru/lidswitch/"

  depends_on arch: :arm64
  depends_on macos: :sequoia

  app "LidSwitch.app"

  caveats <<~EOS
    LidSwitch #{version} is ad-hoc signed and not yet notarized. If Gatekeeper
    blocks the first launch, Control-click LidSwitch in /Applications, choose
    Open, and confirm Open.

    Closed-lid work can generate heat and drain the battery. Do not put a
    running MacBook into a bag while the green LidSwitch mode is enabled.
  EOS
end
