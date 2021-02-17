FROM centos as build

RUN dnf groupinstall -y 'Development Tools'

COPY . /python-0.9.1

WORKDIR /python-0.9.1/src

RUN make clean && make

FROM centos as final

COPY --from=build /python-0.9.1 /python-0.9.1

WORKDIR /python-0.9.1/src

ENTRYPOINT ["./python"]
