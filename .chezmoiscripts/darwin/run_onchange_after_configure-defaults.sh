#!/usr/bin/env fish
# vim: filetype=fish

printf "%s\n" \
    NSAutomaticCapitalizationEnabled 0 \
    NSAutomaticDashSubstitutionEnabled 0 \
    NSAutomaticInlinePredictionEnabled 0 \
    NSAutomaticPeriodSubstitutionEnabled 0 \
    NSAutomaticQuoteSubstitutionEnabled 0 \
    NSAutomaticSpellingCorrectionEnabled 0 \
    NSAutomaticTextCorrectionEnabled 0 \
    NSDocumentSaveNewDocumentsToCloud 0 \
    WebAutomaticSpellingCorrectionEnabled 0 \
    AppleShowAllExtensions 1 |
    xargs -n2 sh -c 'defaults write -g "$1" -int "$2"' _

printf "%s\n" \
    autohide int 1 \
    orientation string bottom \
    show-recents int 0 \
    showDesktopGestureEnabled int 0 \
    showLaunchoadGestureEnabled int 0 \
    showMissionControlGestureEnabled int 0 |
    xargs -n3 sh -c 'defaults write com.apple.dock "$1" -"$2" "$3"' _

printf "%s\n" \
    _FXShowPosixPathInTitle int 1 \
    FXPreferredViewStyle string Nlsv \
    _FXSortFoldersFirst int 1 \
    FXRemoveOldTrashItems int 1 \
    FXEnableExtensionChangeWarning int 0 |
    xargs -n3 sh -c 'defaults write com.apple.finder "$1" "-$2" "$3"' _
