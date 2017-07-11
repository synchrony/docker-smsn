#!/bin/sh
# This preserves the logs about a given the knowledge graph across gremlin sessions, within a single docker session.

## Move "$1.$2" to "$1.$(($2+1))", first rotating the target as well.
rotate () {
  if [ -e "$1.$(($2+1))" ]; then rotate "$1" $(($2+1)); fi
  mv -- "$1.$2" "$1.$(($2+1))"
}

for x; do
  ## Break each argument into FILE.NUMBER or just FILE.
  suffix=${x##*.}
  case $suffix in
    *[!0-9]*)
      if [ -e "$x.0" ]; then rotate "$x" 0; fi
      mv -- "$x" "$x.0";;
    *) rotate "${x%.*}" "$suffix";;
  esac
done
