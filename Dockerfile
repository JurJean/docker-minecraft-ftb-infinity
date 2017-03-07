FROM java:8

ENV FTB_INFINITY_URL https://www.feed-the-beast.com/projects/ftb-infinity-lite-1-10/files/2385786/download
ENV LAUNCHWRAPPER net/minecraft/launchwrapper/1.12/launchwrapper-1.12.jar

RUN curl -SL $FTB_INFINITY_URL -o /tmp/infinity.zip && \
    unzip /tmp/infinity.zip -d /opt/minecraft && \
    mkdir -p /opt/minecraft/$(dirname libraries/${LAUNCHWRAPPER}) && \
    curl -S https://libraries.minecraft.net/$LAUNCHWRAPPER -o /opt/minecraft/libraries/$LAUNCHWRAPPER && \
    curl -SL https://minecraft.curseforge.com/projects/dynmapforge/files/2307083/download -o /opt/minecraft/mods/Dynmap-2.3-forge-1.9.4.jar && \
    find /opt/minecraft -name "*.log" -exec rm -f {} \; && \
    rm -rf /opt/minecraft/ops.* /opt/minecraft/whitelist.* /opt/minecraft/logs/* /tmp/*

ADD eula.txt /opt/minecraft/eula.txt
ADD Start.sh /opt/minecraft/Start.sh

ENV MINECRAFT_VERSION 1.10.2
ENV MINECRAFT_OPTS -server -Xms2048m -Xmx3072m -XX:MaxPermSize=256m -XX:+UseParNewGC -XX:+UseConcMarkSweepGC
ENV MINECRAFT_STARTUP_JAR FTBserver-1.10.2-12.18.3.2234-universal.jar

VOLUME /opt/minecraft/world

EXPOSE 25565
EXPOSE 8123

CMD bash /opt/minecraft/Start.sh
