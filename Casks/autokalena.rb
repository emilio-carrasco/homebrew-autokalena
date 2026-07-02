cask "autokalena" do
  version "0.1.3"
  sha256 "208e04d8220fe51be4d47516bfa00f21632ede7402a39594f6e082b294748317"

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
