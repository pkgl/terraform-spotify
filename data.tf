# Find song by URL
data "spotify_track" "tracks" {
  for_each = local.tracks
  url = each.value
}