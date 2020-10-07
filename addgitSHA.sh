#!/bin/bash

`sed -i "s/ThisWillBeReplaced/`git rev-parse HEAD`/" *.pl`
