# PostgreSQL with custom buffer manager
# Note: This is for development/testing purposes only
FROM postgres:16-bookworm

# Install build dependencies
RUN apt-get update && apt-get install -y \
    build-essential \
    git \
    wget \
    libreadline-dev \
    zlib1g-dev \
    && rm -rf /var/lib/apt/lists/*

# Copy custom freelist.c
COPY freelist.c /tmp/freelist.c

# The buffer manager requires integration with full PostgreSQL source
# This Dockerfile sets up the environment for development
# To fully integrate, you would need to:
# 1. Clone PostgreSQL source
# 2. Replace src/backend/storage/buffer/freelist.c
# 3. Rebuild PostgreSQL

# For testing, we just verify the file is present
RUN ls -la /tmp/freelist.c

# Default PostgreSQL entrypoint
EXPOSE 5432
