#!/bin/bash

sha=`git rev-parse HEAD`
`sed -i "s/ThisWillBeReplaced/$sha/" *.pl`
