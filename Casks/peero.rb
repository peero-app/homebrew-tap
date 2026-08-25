cask "peero" do
  version "1.0.2"
  sha256 "7c8bab7370bd7a286a8180b53448221ec46e44b23c90dbb805c7dde433740452"

  url "https://github.com/peero-app/peero/releases/download/v#{version}/peero-macos.zip"
  name "Peero"
  desc "Local network messaging with text, voice messages, and file transfer"
  homepage "https://peero-app.github.io/peero/"

  app "peero.app"

  caveats <<~EOS
    peero n'est pas signe/notarise par Apple. Au premier lancement, si
    macOS bloque l'ouverture, faites un clic droit sur l'app > Ouvrir,
    ou lancez : xattr -cr /Applications/peero.app
  EOS
end
