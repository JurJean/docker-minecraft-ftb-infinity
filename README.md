docker-minecraft-ftb-infinity
=============================

Minecraft FTB infinity server with dynmap included.

To run the server:

  docker run -itd -v "$pwd/data:/opt/minecraft/world" -p "25565:25565" -p "80:8123" jurjean/minecraft-ftb-infinity

