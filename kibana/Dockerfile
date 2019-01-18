ARG ELK_VERSION

# https://github.com/elastic/kibana-docker
FROM docker.elastic.co/kibana/kibana:${ELK_VERSION}

# Add your kibana plugins setup here
# Example: RUN kibana-plugin install <name|url>

# ...
ENV XPACK_ML_ENABLED false
# ...

# modified from: https://github.com/elastic/kibana-docker/issues/27
# Jarpy's answer
# A "hack" to force kibana to optimize

RUN /usr/local/bin/kibana-docker 2>&1 | grep -m 1 "Optimization of .* complete" # [1]
