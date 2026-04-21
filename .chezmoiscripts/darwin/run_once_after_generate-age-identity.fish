#!/usr/bin/env fish

test -f ~/.secrets/chezmoi.age.identity
and return 0

age-plugin-se keygen -o ~/.secrets/chezmoi.age.identity
age-plugin-se recipients -i ~/.secrets/chezmoi.age.identity >>~/.secrets/chezmoi.age.recipient

chezmoi re-add ~/.secrets/chezmoi.age.recipient
