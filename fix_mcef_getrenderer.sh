#!/bin/bash

echo "=== Arreglando método getRenderer() en MCEFBrowser ==="

# Encontrar la línea del método y reconstruirlo correctamente
sed -i '
/public MCEFRenderer getRenderer() {/,/public boolean isRendererReady() {/ {
    /public MCEFRenderer getRenderer() {/,/public boolean isRendererReady() {/ {
        c\
    public MCEFRenderer getRenderer() {\
        return renderer;\
    }\
\
    /**\
     * Check if the renderer is fully initialized and ready to use.\
     * @return true if renderer is initialized with a valid texture\
     */\
    public boolean isRendererReady() {
    }
}
' forge/src/main/java/com/cinemamod/mcef/MCEFBrowser.java

echo "=== Método getRenderer() arreglado ==="
