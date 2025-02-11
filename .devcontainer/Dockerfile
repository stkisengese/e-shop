ARG RUBY_VERSION=3.4.1
FROM ruby:${RUBY_VERSION}-slim

# Install development dependencies
RUN apt-get update -qq && \
    apt-get install --no-install-recommends -y \
    build-essential \
    git \
    libvips \
    pkg-config \
    sqlite3 \
    libsqlite3-dev \
    curl \
    nodejs \
    npm \
    && rm -rf /var/lib/apt/lists/* /var/cache/apt/archives/*

# Install yarn
RUN npm install -g yarn

# Configure bundler
ENV BUNDLE_PATH=/usr/local/bundle
ENV BUNDLE_BIN=/usr/local/bundle/bin
ENV PATH="${BUNDLE_BIN}:${PATH}"

WORKDIR /rails

# Install debug tools
RUN gem install \
    solargraph \
    rubocop \
    ruby-debug-ide \
    debase

CMD ["bash"]