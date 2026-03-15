# docker ps to dispaly only selected commands
docker ps -a --format="table {{.ID}}\t{{.RunningFor}}\t{{.Status}}\t{{.Names}}"

# docker compose in detatch mode
docker compose up -d

# docker-compose with remove orphans and volumes.
docker-compose down --remove-orphans --volumens

# buield and start detach mode
dockerl-compose up --build -d

