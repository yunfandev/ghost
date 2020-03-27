FROM ghost:3-alpine as cloudinary
WORKDIR $GHOST_INSTALL/current
RUN su-exec node yarn add ghost-storage-cloudinary@2

FROM ghost:3-alpine
COPY --chown=node:node --from=cloudinary $GHOST_INSTALL/current/node_modules $GHOST_INSTALL/current/node_modules
COPY --chown=node:node --from=cloudinary $GHOST_INSTALL/current/node_modules/ghost-storage-cloudinary $GHOST_INSTALL/current/core/server/adapters/storage/ghost-storage-cloudinary