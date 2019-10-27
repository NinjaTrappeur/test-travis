#!/usr/env bash

listenerbin=$(nix-build listener.nix)
(sleep 500 && echo "bullshit")&
${listenerbin}
