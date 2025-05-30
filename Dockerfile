FROM ubuntu:22.04

# Install system dependencies
RUN apt-get update && apt-get install -y \
  python3 python3-pip \
  nodejs npm \
  yarn \
  postgresql-client \
  && rm -rf /var/lib/apt/lists/*

# Set working directory
WORKDIR /app

# Copy project files
COPY . .

# Install Python dependencies
RUN pip3 install -r requirements.txt

# Install Node dependencies
RUN yarn install --immutable --immutable-cache

# Build the web project
RUN yarn turbo run build --filter=web

# Run migrations
RUN cd apiserver && python3 manage.py migrate

# Start the app
CMD ["yarn", "workspace", "web", "start"]
