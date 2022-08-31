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

resource "spotify_playlist" "playlist" {
  name        = "Terraform Playlist"
  description = "This playlist was created by Terraform"
  public      = true

  tracks = [
    data.spotify_track.miss_you.id,
    data.spotify_track.doja.id,
    data.spotify_track.holy_trinity.id,
    data.spotify_track.ferrari.id,
    data.spotify_track.kein_schlaf.id,
    data.spotify_track.gas.id,
  ]
}