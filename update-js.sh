#!/usr/bin/env bash
set -euxo pipefail
SUBLIME_PATH="$HOME/Library/Application Support/Sublime Text/"
SYNTAX_PATH="$SUBLIME_PATH/Packages/User/JS Custom/Syntaxes"

cp "$SYNTAX_PATH/TypeScript (JSX).sublime-syntax" JavaScript/TSX.sublime-syntax
cp "$SYNTAX_PATH/TypeScript.sublime-syntax" JavaScript/TypeScript.sublime-syntax
cp "$SYNTAX_PATH/Default.sublime-syntax" JavaScript/JavaScript.sublime-syntax

cp "$SYNTAX_PATH/React.sublime-syntax" JavaScript/JSX.sublime-syntax
sed --version | grep -q 'GNU' > /dev/null
IS_GNU=$?
function sed_inplace() {
    if [ !IS_GNU ] && [ "$OSTYPE" == "darwin"* ]; then
        sed -i '' "$@"
    else
        sed -i "$@"
    fi
}
sed_inplace -E '/\s+- js$/d' JavaScript/JSX.sublime-syntax
sed_inplace -E 's|^name: JS.*|name: JSX|' JavaScript/JSX.sublime-syntax
sed_inplace -E 's|^scope: source.js.*|scope: source.jsx|' JavaScript/JSX.sublime-syntax

cp "$SYNTAX_PATH/~embed.sublime-syntax" JavaScript/embed.sublime-syntax
