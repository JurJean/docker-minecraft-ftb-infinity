docker-minecraft-ftb-infinity
=============================

__Minecraft FTB Infinity Lite__ server with __dynmap__ included.

To run the server:

  docker run -itd -v "$pwd/data:/opt/minecraft/world" -p "25565:25565" -p "80:8123" jurjean/minecraft-ftb-infinity

To add additional mods mount a mod directory like so:

  docker run -itd -v "$pwd/mods:/opt/minecraft/mods_volume" jurjean/minecraft-ftb-infinity
