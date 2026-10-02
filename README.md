# Vast Steam Gaming

Base image: `lscr.io/linuxserver/steam:latest`

Adds:
- Sunshine
- Tabby terminal (auto-opens)
- xterm fallback
- gaming-oriented Selkies defaults
- right-click entries for Tabby, xterm, Steam, ProtonUp-Qt and Sunshine log

Important: Vast.ai normally maps exposed container ports to random external ports. Sunshine/Moonlight expects a family of related ports, so Moonlight may not work directly on every Vast host even though Sunshine is installed. The built-in Selkies browser stream remains the reliable fallback.

Vast template:
- Image: `ghcr.io/YOUR_GITHUB_USERNAME/vast-steam-gaming:latest`
- Launch mode: Docker ENTRYPOINT
- Docker options: `--shm-size=1gb --security-opt seccomp=unconfined --security-opt apparmor=unconfined`
- PUID=1000
- PGID=1000
- TZ=Asia/Ho_Chi_Minh
- CUSTOM_USER=gamer
- PASSWORD=<temporary unique password>
- Disk: 64 GB minimum for small-game testing; 100 GB+ for larger games.
- Keep the template Private.
