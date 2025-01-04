ARG KEYCLOAK_VERSION=latest
FROM quay.io/keycloak/keycloak:${KEYCLOAK_VERSION} as builder
WORKDIR /opt/keycloak

USER root

RUN tr -dc A-Za-z0-9 </dev/urandom | head -c 13 > /tmp/.pwd
RUN keytool -genkeypair -storepass $(cat /tmp/.pwd) -storetype PKCS12 -keyalg RSA -keysize 2048 -dname "CN=server" -alias server  -keystore conf/server.keystore
RUN /opt/keycloak/bin/kc.sh build

# Copying the built customized keycloakify theme into the image.
COPY ./dist_keycloak/ebadfd-theme.jar /opt/keycloak/providers/

RUN chown -R root:root /opt/keycloak/
RUN chown -R root:root /tmp/.pwd

FROM quay.io/keycloak/keycloak:${KEYCLOAK_VERSION}

USER root

COPY --from=builder /opt/keycloak/ /opt/keycloak/
COPY --from=builder /tmp/.pwd /tmp/.pwd

RUN chmod -R u+x /opt/keycloak/
RUN chmod -R u+x /tmp/.pwd

RUN chown -R 1000:1000 /opt/keycloak/
RUN chown -R 1000:1000 /tmp/.pwd

USER 1000

ENTRYPOINT ["/bin/sh", "-c", "export PWD=$(cat /tmp/.pwd) && rm -f /tmp/.pwd && /opt/keycloak/bin/kc.sh start --https-key-store-password=$PWD","--proxy", "edge", "--optimized"]
