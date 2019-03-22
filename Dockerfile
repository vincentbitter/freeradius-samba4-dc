FROM ubuntu:19.04
LABEL maintainer="Vincent Bitter"

ENTRYPOINT [ "/init" ]

# RADIUS Authentication Messages
EXPOSE 1812/udp

# RADIUS Accounting Messages
EXPOSE 1813/udp

# Install active directory packages
RUN apt update
RUN apt -y install samba
RUN apt -y install winbind
RUN apt -y install krb5-user

# Install freeradius 3.0.X
RUN apt -y install freeradius freeradius-config 

# Copy files
COPY init /
COPY configure /
RUN ["chmod", "+x", "/init"]
RUN ["chmod", "+x", "/configure"]

CMD [ "freeradius", "-X", "-f" ]