cask "autokalena" do
  version "0.1.2"
  sha256 "99bb58ceeaf285640559ebee612f89a64c07a9de28cda814fedb9a5b726df006"

  url "https://github.com/emilio-carrasco/autokalena/releases/download/v#{version}/AutoKalena-macos.dmg"
  name "AutoKalena"
  desc "Reserva tu plaza de parking automaticamente"
  homepage "https://github.com/emilio-carrasco/autokalena"

  app "AutoKalena.app"

  # App sin firmar (sin cuenta de Apple Developer): quitamos la cuarentena para que
  # Gatekeeper no la bloquee al abrir.
  postflight do
    system_command "/usr/bin/xattr",
                   args: ["-dr", "com.apple.quarantine", "#{appdir}/AutoKalena.app"]
  end

  zap trash: [
    "~/Library/Application Support/AutoKalena",
  ]
end
