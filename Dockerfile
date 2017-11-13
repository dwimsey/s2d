
FROM centos:centos7

LABEL maintainer="David Wimsey <david@wimsey.us>"


LABEL io.k8s.description="S2I Test Image" \
    io.k8s.display-name="S2I Test" \
    io.openshift.tags="builder,pwned,dontusethisimage,securitytest" \
    # this label tells s2i where to find its mandatory scripts
    # (run, assemble, save-artifacts)
    io.openshift.s2i.scripts-url="image:///usr/libexec/s2i"

# Copy the S2I scripts to /usr/libexec/s2i since we set the label that way
COPY ./s2i/bin/ /usr/libexec/s2i

USER 1001

# Set the default port for applications built using this image
EXPOSE 8080

# Modify the usage script in your application dir to inform the user how to run
# this image.
CMD ["/usr/libexec/s2i/usage"]
