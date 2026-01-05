#!/bin/bash

echo "=== Parcheando MCEFBrowser para manejar renderer nulo ==="

# Buscar el método getRenderer y agregar logging
sed -i '/public MCEFRenderer getRenderer() {/,/^    }/c\
    public MCEFRenderer getRenderer() {\
        if (renderer == null) {\
            MCEF.LOGGER.warn("getRenderer() called but renderer is null! Browser may not be fully initialized yet.");\
        } else if (renderer.getTextureID() == 0) {\
            MCEF.LOGGER.debug("Renderer exists but texture not yet initialized (textureID=0)");\
        }\
        return renderer;\
    }' forge/src/main/java/com/cinemamod/mcef/MCEFBrowser.java

echo "=== Parche aplicado a MCEFBrowser ==="
