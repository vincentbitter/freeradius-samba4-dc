FROM ubuntu:20.04
LABEL maintainer="Vincent Bitter, Shatov Ilya"

# Set environment variables to avoid interactive prompts during package installation
ENV DEBIAN_FRONTEND=noninteractive

# Expose RADIUS ports
EXPOSE 1812/udp 1813/udp 18121/udp

# Install necessary packages in a single RUN command to reduce layers
RUN apt update && \
    apt -y install --no-install-recommends \
        samba \
        winbind \
        krb5-user \
        freeradius \
        freeradius-config && \
    apt clean && \
    rm -rf /var/lib/apt/lists/*

# Copy initialization and configuration scripts
COPY init /init
COPY configure /configure

# Make scripts executable
RUN chmod +x /init /configure

# Set the entrypoint
ENTRYPOINT ["/init"]

# Start FreeRADIUS in debug mode
CMD ["freeradius", "-X", "-f"]

# Healthcheck to ensure FreeRADIUS is running
HEALTHCHECK --interval=1m --timeout=15s --retries=3 \
    CMD freeradius -C -X || exit 1
