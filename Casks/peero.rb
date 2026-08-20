cask "peero" do
  version "1.0.0"
  sha256 "d55be209182d3be54ac21fb2d91fac662158380868b3b559694f1fd8d3a7bd60"

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
