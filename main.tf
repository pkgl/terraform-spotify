terraform {
  required_providers {
    spotify = {
      version = "~> 0.2.6"
      source  = "conradludgate/spotify"
    }
  }
}

provider "spotify" {
  api_key = var.spotify_api_key
}

locals {
  tracks = {
      miss_you = "https://open.spotify.com/track/4tRhRLBxIZ34Iw0eCuiC03?si=6506cf637de74da0",
      doja = "https://open.spotify.com/track/3LtpKP5abr2qqjunvjlX5i?si=813c0207d7f042c1",
      holy_trinity = "https://open.spotify.com/track/02D7cBNL1rpCkvTja8S1ns?si=34fbb3b99bdd402c",
      ferrari = "https://open.spotify.com/track/4zN21mbAuaD0WqtmaTZZeP?si=f8c19b2574ba4c22",
      kein_schlaf = "https://open.spotify.com/track/6416zJN0FGPmh1Ph4BH2h3?si=33802419891a4b95",
      gas = "https://open.spotify.com/track/3QsIonKmbe7lollXunUVRZ?si=793c96a9ab6143a2",
      affen = "https://open.spotify.com/track/6QNgcN2uHhXJG4RWDPyQQF?si=3dddd6e146704d9d",
      rumble = "https://open.spotify.com/track/1GfBLbAhZUWdseuDqhocmn?si=9784615a9cb4431f",
  }
}

resource "spotify_playlist" "playlist" {
  name        = "Terraform Playlist"
  description = "This playlist was created by Terraform"
  public      = true

  tracks = [
    for track in data.spotify_track.tracks:
      track.id
  ]

}