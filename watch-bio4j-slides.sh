#/bin/sh
while inotifywait -e close_write bio4j-bigger-faster-leaner-slides.md; do ./slides.sh bio4j-bigger-faster-leaner-slides.md bio4j-bigger-faster-leaner-slides.html; done
