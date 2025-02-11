ARG RUBY_VERSION=3.4.1
FROM ruby:${RUBY_VERSION}-slim

# Switch to root for installation
USER root

# Install development dependencies
RUN set -eux; \
    apt-get update && \
    apt-get install -y --no-install-recommends \
    build-essential \
    git \
    libvips \
    pkg-config \
    sqlite3 \
    libsqlite3-dev \
    curl \
    nodejs \
    npm \
    && rm -rf /var/lib/apt/lists/*

# Install yarn
RUN npm install -g yarn

# Configure bundler
ENV BUNDLE_PATH=/usr/local/bundle \
    BUNDLE_BIN=/usr/local/bundle/bin \
    PATH="${BUNDLE_BIN}:${PATH}"

WORKDIR /rails

# Install debug tools
RUN gem install \
    solargraph \
    rubocop \
    ruby-debug-ide \
    debase

# Switch back to non-root user
USER 1000:1000

CMD ["bash"]