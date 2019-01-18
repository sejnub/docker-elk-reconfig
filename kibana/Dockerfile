ARG ELK_VERSION

# https://github.com/elastic/kibana-docker
FROM docker.elastic.co/kibana/kibana:${ELK_VERSION}

# Add your kibana plugins setup here
# Example: RUN kibana-plugin install <name|url>

# ...
ENV XPACK_ML_ENABLED false
ENV XPACK_APM_ENABLED false

# ...

# modified from: https://github.com/elastic/kibana-docker/issues/27
# Jarpy's answer
# A "hack" to force kibana to optimize
# Last time it took about 8 minutes (474.62 seconds)

# Maybe we should also check for "Status changed from uninitialized to green" for the case that no optimization is taking place.
#
# grep -E 'word1|word2' *.doc
RUN /usr/local/bin/kibana-docker 2>&1 | grep -m 1 -E 'Optimization of .* complete|Status changed from uninitialized to green' # [1]
