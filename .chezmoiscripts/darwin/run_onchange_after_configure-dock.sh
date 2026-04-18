#!/usr/bin/env fish

trap 'killall Dock' EXIT

set to_remove \
    Launchpad \
    Safari \
    Messages \
    Mail \
    Maps \
    Photos \
    FaceTime \
    Calendar \
    Contacts \
    Reminders \
    Notes \
    Freeform \
    TV \
    Music \
    Keynote \
    Numbers \
    Pages \
    Tips \
    'App Store'

for label in $to_remove
    dockutil --no-restart --remove "$label" &>/dev/null
    and echo "Removed $label from dock"
end

function dockinsert -a pos -a path
    dockutil --find "file://$(realpath "$path")"
    or dockutil --no-restart -p "$pos" -a "$path"
end

function dockbefore -a before -a path
    dockutil --find "file://$(realpath "$path")"
    or dockutil --no-restart -B "$before" -a "$path"
end

function dockafter -a after -a path
    dockutil --find "file://$(realpath "$path")"
    or dockutil --no-restart -A "$after" -a "$path"
end

alias dockprepend='dockbefore NOTREAL'
alias dockappend='dockafter NOTREAL'

# Install Google Chrome if not installed 
begin
    dockutil --find 'Google Chrome'
    or dockutil --find 'Google Chrome Dev'
    or dockprepend '/Applications/Google Chrome Dev.app'
    or dockprepend '/Applications/Google Chrome.app'
end &>/dev/null

begin
    dockappend "/Applications/Zed Preview.app"
    dockappend /Applications/Cursor.app
    dockappend /Applications/Ghostty.app
    dockappend /Applications/Numi.app
    dockappend /Applications/Obsidian.app
end &>/dev/null

dockutil -L

return 0
