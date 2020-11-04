#!/bin/sh

source /etc/os-release

echo "Starting JMusicBot by Jagrosh: https://github.com/jagrosh/MusicBot"
echo "Docker container maintained by Hubok: https://github.com/hubok/JMusicBot"
echo "JMusicBot Version: $VERSION_JMB"
echo "Java Version:      $(apk info --no-cache openjdk$VERSION_JAVA-jre | sed '3!d' | sed 's/ description://g')"
echo "OS Version:        $NAME $VERSION_ID"
echo "System Info:       $(uname -a)"

java -jar -Dnogui=true jmusicbot.jar
