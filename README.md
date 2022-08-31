# Spotify Playlist created by Terraform

Create a spotify playlist with terraform 

## Installation

1. Before you can use Terraform with Spotify, you need to create a Spotify developer app and run Spotify's authorization proxy server. Login to the [Spotify developer dashboard](https://developer.spotify.com/dashboard/login).

2. Create a new app

3. Once Spotify creates the application, find and click the green Edit Settings button on the top right side.Copy the URI below into the Redirect URI field and click Add so that Spotify can find its authorization application locally on port 27228 at the correct path. Scroll to the bottom of the form and click Save. 

```bash
http://localhost:27228/spotify_callback
```

4. Return to your terminal and set the redirect URI as an environment variable, instructing the authorization proxy server to serve your Spotify access tokens on port 27228.

```bash
$ export SPOTIFY_CLIENT_REDIRECT_URI=http://localhost:27228/spotify_callback
```

5. Next, create a file called .env with the following contents to store your Spotify application's client ID and secret.

```bash
SPOTIFY_CLIENT_ID=
SPOTIFY_CLIENT_SECRET=
```

6. Make sure Docker Desktop is running, and start the server. It will run in your terminal's foreground.

```bash
$ docker run --rm -it -p 27228:27228 --env-file ./.env ghcr.io/conradludgate/spotify-auth-proxy
```

7. Visit the authorization server's URL by visiting the link that your terminal output lists after Auth:.
The server will redirect you to Spotify to authenticate. After authenticating, the server will display Authorization successful, indicating that the Terraform provider can use the server to retrieve access tokens. Leave the server running.

8. Create an environment variable with the value returned by the Docker container
```bash
$ export TF_VAR_spotify_api_key=your_api_key_returned_by_docker_container
```
9. Let Terraform run!
```bash
$ terraform init && terraform plan
terraform apply
```

## Contributing
Pull requests are welcome. For major changes, please open an issue first to discuss what you would like to change.

Please make sure to update tests as appropriate.

## Tutorial with images
[Create a Spotify Playlist with Terraform](https://learn.hashicorp.com/tutorials/terraform/spotify-playlist)