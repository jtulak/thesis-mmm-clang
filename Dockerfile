FROM jtulak/myfedora
RUN dnf -y install \
           libaio-devel \
           libuuid-devel \
           libattr-devel \
           libacl-devel \
           gettext \
           libblkid-devel \
           csbuild \
           bc
RUN mv /usr/bin/cppcheck /usr/bin/cppcheck.disabled
RUN mv /usr/bin/gcc /usr/bin/gcc.disabled
RUN mv /usr/bin/clang /usr/bin/gcc

workdir /workdir
volume /workdir

ADD run-test.sh /
ENTRYPOINT ["/bin/bash","/run-test.sh"]
