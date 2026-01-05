#!/bin/bash

echo "=== Aplicando parche robusto a MCEFBrowser ==="

# Agregar método isRendererReady() después de getRenderer()
sed -i '/public MCEFRenderer getRenderer() {/a\
\
    /**\
     * Check if the renderer is fully initialized and ready to use.\
     * @return true if renderer is initialized with a valid texture\
     */\
    public boolean isRendererReady() {\
        return renderer != null && renderer.getTextureID() != 0;\
    }' forge/src/main/java/com/cinemamod/mcef/MCEFBrowser.java

echo "=== Método isRendererReady() agregado ==="
