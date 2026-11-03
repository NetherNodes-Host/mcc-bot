FROM mcr.microsoft.com/dotnet/runtime:8.0

WORKDIR /app

# Install curl and unzip utilities
RUN apt-get update && apt-get install -y curl unzip && rm -rf /var/lib/apt/lists/*

# Automatically fetch release 20260929-519 directly from GitHub
RUN curl -L -o mcc.zip https://github.com/MCCTeam/Minecraft-Console-Client/releases/download/20260929-519/MinecraftClient-20260929-519-linux-x64.zip

# Unpack the release archive
RUN unzip mcc.zip && rm mcc.zip

# Copy your proxy configuration into the container
COPY config.ini .

# Grant execution permissions
RUN chmod +x MinecraftClient-20260929-519-linux-x64

# Start MCC
CMD ["./MinecraftClient-20260929-519-linux-x64"]