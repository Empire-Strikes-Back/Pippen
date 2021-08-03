#!/bin/bash

repl(){
  clj \
    -X:repl deps-repl.core/process \
    :main-ns webgl-widgets.main \
    :port 7788 \
    :host '"0.0.0.0"' \
    :repl? true \
    :nrepl? false
}

main(){
  clojure \
    -J-Dclojure.core.async.pool-size=1 \
    -J-Dclojure.compiler.direct-linking=false \
    -M -m webgl-widgets.main
}

uberjar(){
  clj \
    -X:uberjar genie.core/process \
    :uberjar-name out/webgl-widgets.standalone.jar \
    :main-ns webgl-widgets.main
  mkdir -p out/jpackage-input
  mv out/webgl-widgets.standalone.jar out/jpackage-input/
}

"$@"