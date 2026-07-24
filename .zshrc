
alias mre='make re'
alias mcl='make clean'
alias mfcl='make fclean'
alias mrc='make re && make clean'

cmimalloc() { command git clone https://github.com/microsoft/mimalloc.git "$@"; }
cdogs() { command git clone https://github.com/cxong/cdogs-sdl.git "$@"; }
cflap() { command git clone https://github.com/sourabhv/FlapPyBird.git "$@"; }
cwordcloud() { command git clone https://github.com/amueller/word_cloud.git "$@"; }

# =========================
# Environment
# =========================

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && source "$NVM_DIR/nvm.sh"
[ -s "$NVM_DIR/bash_completion" ] && source "$NVM_DIR/bash_completion"

export PATH="$HOME/homebrew/bin:$HOME/.local/bin:$PATH"

if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='vim'
else
  export EDITOR='code'
fi

command -v code >/dev/null || export EDITOR='nvim'

PROMPT="%F{cyan}%~ %# %f"

# =========================
# Core Helpers (Functions)
# =========================

# Clipboard helpers
cpy() { pbcopy; }

c() {
  "$@" | tee >(pbcopy)
}

h() { git rev-parse HEAD; }
hc() { git rev-parse HEAD | pbcopy; }

# Grep helpers
lgrep() { ls -lah | grep "$@"; }
lsgrep() { ls | grep "$@"; }

# Clone helpers
furl() { git clone https://github.com/gruns/furl.git "$@"; }
smallpond() { git clone https://github.com/deepseek-ai/smallpond.git "$@"; }
webboost() { git clone https://github.com/Vishmehta001/WebBoost.git "$@"; }
click() { git clone https://github.com/pallets/click.git "$@"; }
mimalloc() { git clone https://github.com/microsoft/mimalloc.git "$@"; }
mockpytest() { git clone https://github.com/pytest-dev/pytest-mock.git "$@"; }

# Build helper
buildfurl() {
  mkdir build &&
  cd build &&
  cmake .. &&
  make -j8 &&
  sudo make install &&
  cd ../..
}

startmetro() { npx react-native start --reset-cache "$@"; }


# Alignerr helpers
_alignerr_repo_root() { git rev-parse --show-toplevel 2>/dev/null; }
_alignerr_repo_name() { basename "$(_alignerr_repo_root)"; }
_alignerr_repo_parent() { dirname "$(_alignerr_repo_root)"; }

_alignerr_check_repo() {
  _alignerr_repo_root >/dev/null || { echo "Not inside git repo"; return 1; }
}

starttar() {
  _alignerr_check_repo || return 1
  local root parent repo tarpath
  root="$(_alignerr_repo_root)"
  parent="$(_alignerr_repo_parent)"
  repo="$(_alignerr_repo_name)"
  tarpath="$parent/${repo}-initial.tar"
  (cd "$root" && git archive --format=tar --prefix="${repo}/" HEAD > "$tarpath")
  ls -lh "$tarpath"
}

finaltar() {
  _alignerr_check_repo || return 1
  local parent repo tarpath
  parent="$(_alignerr_repo_parent)"
  repo="$(_alignerr_repo_name)"
  tarpath="$parent/${repo}-final.tar"
  tar \
    --exclude-vcs \
    --exclude='.git' \
    --exclude='.DS_Store' \
    --exclude='node_modules' \
    --exclude='__pycache__' \
    --exclude='*.pyc' \
    --exclude='.venv' \
    --exclude='venv' \
    --exclude='.env' \
    --exclude='.pytest_cache' \
    --exclude='.mypy_cache' \
    --exclude='.cache' \
    --exclude='*.log' \
    -cf "$tarpath" \
    -C "$parent" "$repo"
  ls -lh "$tarpath"
}

vstask() { _alignerr_check_repo || return 1; claude-hfi --vscode; }
hfi() { _alignerr_check_repo || return 1; claude-hfi --vscode; }

continuetask() { claude-hfi --continue; }

# =========================
# Shortcut Wrappers (Functions)
# =========================

gs() { command git status "$@"; }
gst() { command git status "$@"; }
ga() { command git add "$@"; }
gaa() { command git add --all "$@"; }
gb() { command git branch "$@"; }
gbr() { command git branch -a "$@"; }
gba() { command git branch -a "$@"; }
gco() { command git checkout "$@"; }
gcm() {
  if (( $# == 0 )); then
    command git commit
  elif [[ "$1" == -* ]]; then
    command git commit "$@"
  else
    command git commit -m "$*"
  fi
}
gp() { command git push "$@"; }
gl() { command git log "$@"; }
gd() { command git diff "$@"; }
gcl() { command git clone "$@"; }
grhh() { command git reset --hard "$@"; }
grv() { command git remote -v "$@"; }
python3() { /usr/local/bin/python3 "$@"; }

l() { command ls -lah "$@"; }
ls() { command ls -G "$@"; }
ll() { command ls -lh "$@"; }
la() { command ls -lAh "$@"; }

md() { command mkdir -p "$@"; }
rd() { command rmdir "$@"; }

v() { command vim "$@"; }
n() { command nvim "$@"; }
cl() { command clear "$@"; }
e() { exit "$@"; }
x() { exit "$@"; }

cat() {
  if command -v bat >/dev/null 2>&1; then
    command bat "$@"
  else
    command cat "$@"
  fi
}

volup() { osascript -e 'set volume output volume ((output volume of (get volume settings)) + 10)'; }
voldown() { osascript -e 'set volume output volume ((output volume of (get volume settings)) - 10)'; }
volumemute() { osascript -e 'set volume output volume 0'; }

czsh() { command code "$HOME/.zshrc"; }
szsh() { source "$HOME/.zshrc"; }
cbash() { command code "$HOME/.bash_profile"; }
sbash() { source "$HOME/.bash_profile"; }
cgit() { command code "$HOME/.gitconfig"; }
gitc() { command code "$HOME/.gitconfig"; }
sgit() { command git config --global --edit; }

nrd() { npm run dev; }

# alignerr
sub () {
  echo "Yo bro WAZZUP?"
  echo ""
  echo "Task number Bruder? (Enter if u dont give a 🖕): "
  read -r TASKNUM
  echo "give UUID 🜺🕳️   : "
  read -r UUID
  echo ""
  echo "Repo path (Enter <-> current directory): "
  read -r REPO
  echo ""
  if [ -z "$REPO" ]; then REPO="$(pwd)"; fi
  echo "Starting commit hash (stupid to not commit in between turns huh? => Enter ): "
  read -r START
  echo ""

  # Cause u stupid enough enjoy free HEAD
  if [ -z "$START" ]; then
    echo "Hi stupid 💩, taking care of HEAD, so chill out 🧘‍♂️"
    START="$(cd "$REPO" && git rev-parse HEAD)"
    echo "Using HEAD commit: $START"
  fi

  # Decide diff filename
  if [ -z "$TASKNUM" ]; then
    DIFFNAME="final.diff"
  else
    DIFFNAME="task${TASKNUM}_final.diff"
  fi


  SESSION_DIR=""
  echo ""
  echo "🥙 🥙 🥙 🥙 🥙 🥙 🥙 🥙 🥙 🥙 🥙 🥙 🥙 🥙"
  echo ""
  if [ -d "/tmp/claude-hfi/$UUID" ]; then
    SESSION_DIR="/tmp/claude-hfi/$UUID"
  else
    SESSION_DIR="$(find /var/folders -maxdepth 8 -type d -path "*/claude-hfi/*" -name "$UUID" 2>/dev/null | head -n 1)"
  fi

  if [ -z "$SESSION_DIR" ] || [ ! -d "$SESSION_DIR" ]; then
    echo "YO BRO? NO seesion! maybe NO MONEY!! 😔"
    return 1
  fi

  echo "Session dir: $SESSION_DIR"

  # Yo! this is for 'auto tar Archive'
  rm -rf ~/"$UUID" 2>/dev/null
  cp -R "$SESSION_DIR" ~/
  (cd ~ && tar -cf "$UUID.tar" "$UUID") || return 1
  rm -rf ~/"$UUID" 2>/dev/null

  # Yo! this is for 'auto diff'
  if [ ! -d "$REPO/.git" ]; then
    echo "stupid 💩! this is Not a git repo: $REPO"
    return 1
  fi

  echo ""
  echo ""
  echo " By the way "
  echo " Heres a pita pyramid for no reason whatsoever"
  echo ""
  echo ""
  echo "                    🥙   "
  echo "                  🥙 🥙  "
  echo "               🥙 🥙 🥙 🥙 "
  echo "            🥙 🥙 🥙 🥙 🥙 🥙 "
  echo "         🥙 🥙 🥙 🥙 🥙 🥙 🥙 🥙 "
  echo "      🥙 🥙 🥙 🥙 🥙 🥙 🥙 🥙 🥙 🥙 "
  echo "   🥙 🥙 🥙 🥙 🥙 🥙 🥙 🥙 🥙 🥙 🥙 🥙"
  echo "🥙 🥙 🥙 🥙 🥙 🥙 🥙 🥙 🥙 🥙 🥙 🥙 🥙 🥙"

  echo ""
  echo ""
  echo " Thats a good pita 🫓 pyramid, if u dont think so 🖕 🫵 🏖️"
  echo ""
  echo " Hmmmmmmmmm! "


  (cd "$REPO" && git add -A && git diff "$START" > ~/"$DIFFNAME") || return 1

  DOWNLOADS="$HOME/Downloads"

  # Mandatory move to Downloads
  mv ~/"$UUID.tar" "$DOWNLOADS/"
  mv ~/"$DIFFNAME" "$DOWNLOADS/"
  echo ""
  echo "Mandatory move to Downloads ✌️"
  ls -lh "$DOWNLOADS/$UUID.tar" "$DOWNLOADS/$DIFFNAME"

  echo ""
  echo "Done my G, upload for 300💰"

  echo ""
  echo " Then go buy some 👇"
  echo "🥙 🥙 🥙 🥙 🥙 🥙 🥙 🥙 🥙 🥙 🥙 🥙 🥙 🥙"
}

tmuxlog() {
  [[ -z "$1" ]] && { echo "usage: tattach SESSION" >&2; return 2; }

  local session="$1"
  local folder
  local logdir
  local logfile

  tmux has-session -t "$session" 2>/dev/null || {
    echo "tmux session not found: $session" >&2
    return 1
  }

  read "folder?Folder name: "
  [[ -z "$folder" ]] && { echo "folder name cannot be empty" >&2; return 2; }

  logdir="$HOME/Downloads/cot/$folder"
  logfile="$logdir/tmux-${session//[^A-Za-z0-9_.-]/_}.log"

  mkdir -p -- "$logdir" || return 1
  tmux capture-pane -p -S - -t "$session" >| "$logfile"
  tmux pipe-pane -o -t "$session" "cat >> ${(q)logfile}"
  tmux attach -t "$session"
}

tmuxattach() {
  emulate -L zsh

  if (( $# < 1 )); then
    echo "usage: tattach SESSION" >&2
    return 2
  fi

  local session="$1"
  local foldername logfile logdir safe_session

  if ! tmux has-session -t "$session" 2>/dev/null; then
    echo "tmux session not found: $session" >&2
    return 1
  fi

  printf "Folder name: "
  IFS= read -r foldername || return 1

  foldername="${foldername//[[:space:]]/}"
  if [[ -z "$foldername" ]]; then
    echo "folder name cannot be empty" >&2
    return 2
  fi

  safe_session="${session//[^A-Za-z0-9_.-]/_}"
  logdir="$HOME/Downloads/cot/$foldername"
  logfile="$logdir/tmux-$safe_session.log"

  mkdir -p -- "$logdir" || return 1

  tmux capture-pane -p -S - -t "$session" >| "$logfile"
  tmux pipe-pane -o -t "$session" "cat >> ${(q)logfile}"

  echo "Logging tmux session '$session' to: $logfile" >&2
  tmux attach -t "$session"
}

_tattach_write_markdown() {
  emulate -L zsh

  local raw_file="$1"
  local md_file="$2"

  [[ -n "$raw_file" && -n "$md_file" && -f "$raw_file" ]] || return 1

  mkdir -p -- "${md_file:h}" || return 1

  {
    print -r -- '````text'
    command cat -- "$raw_file"
    if [[ -s "$raw_file" ]] && [[ "$(command tail -c 1 -- "$raw_file" 2>/dev/null)" != $'\n' ]]; then
      print
    fi
    print -r -- '````'
  } >| "$md_file"
}

_tattach_finalize_pane() {
  emulate -L zsh

  local pane="$1"
  local raw_file
  local md_file

  [[ -n "$pane" ]] || return 1

  tmux pipe-pane -t "$pane"

  raw_file="$(tmux show-option -p -v -t "$pane" @tattach_raw_file 2>/dev/null)"
  md_file="$(tmux show-option -p -v -t "$pane" @tattach_md_file 2>/dev/null)"

  if [[ -n "$raw_file" && -n "$md_file" && -f "$raw_file" ]]; then
    _tattach_write_markdown "$raw_file" "$md_file" || return 1
    echo "Markdown transcript: $md_file" >&2
  fi

  tmux set-option -p -u -t "$pane" @tattach_raw_file >/dev/null 2>&1 || true
  tmux set-option -p -u -t "$pane" @tattach_md_file >/dev/null 2>&1 || true
}

tattach() {
  # Emulate default zsh behaviour
  emulate -L zsh

  if (( $# < 1 )); then
    echo "usage: tattach SESSION [log-file]" >&2
    return 2
  fi

  local session="$1"
  local safe_session="${session//[^A-Za-z0-9_.-]/_}"
  local task_input task_num lane log_dir raw_file md_file pane_target attach_status

  if [[ "$session" =~ -([AB])$ ]]; then
    lane="${match[1]}"
  else
    case "${PWD:t}" in
      A|B)
        lane="${PWD:t}"
        ;;
      *)
        case "${PWD:h:t}" in
          A|B)
            lane="${PWD:h:t}"
            ;;
        esac
        ;;
    esac
  fi

  if ! tmux has-session -t "$session" 2>/dev/null; then
    echo "tmux session not found: $session" >&2
    return 1
  fi

  if [[ -n "$2" ]]; then
    case "$2" in
      *.md)
        md_file="$2"
        raw_file="${2%.md}.txt"
        ;;
      *)
        raw_file="$2"
        md_file="${2%.*}.md"
        [[ "$md_file" == "$2" ]] && md_file="$2.md"
        ;;
    esac
  else
    if [[ ! -r /dev/tty ]]; then
      echo "task number is required when no log-file is provided" >&2
      return 2
    fi

    printf "Task number: " > /dev/tty
    IFS= read -r task_input < /dev/tty || return 1
    task_input="${task_input//[[:space:]]/}"

    if [[ "$task_input" =~ ^task([0-9]+)$ ]]; then
      task_num="task${match[1]}"
    elif [[ "$task_input" =~ ^([0-9]+)$ ]]; then
      task_num="task${match[1]}"
    else
      echo "task number must look like 1 or task1" >&2
      return 2
    fi

    log_dir="/Users/Shared/Alignerr/COT/$task_num/${lane:-misc}"
    raw_file="$log_dir/tmux-$safe_session.txt"
    md_file="$log_dir/tmux-$safe_session.md"
  fi

  mkdir -p -- "${raw_file:h}"

  pane_target="$(tmux display-message -p -t "$session" '#{pane_id}')"
  tmux capture-pane -J -p -S - -t "$pane_target" >| "$raw_file"
  tmux set-option -p -t "$pane_target" @tattach_raw_file "$raw_file" >/dev/null
  tmux set-option -p -t "$pane_target" @tattach_md_file "$md_file" >/dev/null
  tmux pipe-pane -t "$pane_target" "cat >> ${(q)raw_file}"

  echo "Logging tmux session '$session' to: $raw_file" >&2
  echo "Markdown transcript on detach: $md_file" >&2

  tmux attach -t "$session"
  attach_status=$?

  _tattach_finalize_pane "$pane_target"

  return $attach_status
}

tdetach() {
  emulate -L zsh

  if [[ -z "$TMUX" ]]; then
    echo "tdetach must be run from inside tmux" >&2
    return 1
  fi

  _tattach_finalize_pane "$TMUX_PANE"
  tmux detach-client
}

tdetach_session() {
  emulate -L zsh

  if (( $# < 1 )); then
    echo "usage: tdetach_session SESSION" >&2
    return 2
  fi

  local session="$1"

  tmux list-panes -t "$session" -F '#{pane_id}' |
    while read -r pane; do
      _tattach_finalize_pane "$pane"
    done

  tmux detach-client -s "$session"
}

# Make local user launchers available without duplicating PATH entries.
if [[ ":$PATH:" != *":$HOME/.local/bin:"* ]]; then
  export PATH="$HOME/.local/bin:$PATH"
fi

t() {

  if (( $# )); then
    open -na /Applications/iTerm.app --args "$@"
  else
    open -na /Applications/iTerm.app
  fi
}

if [[ -n "${ENABLE_ITERM_SHELL_INTEGRATION:-}" ]] && [[ -e "${HOME}/.iterm2_shell_integration.zsh" ]]; then
  source "${HOME}/.iterm2_shell_integration.zsh"
fi
export ANDROID_HOME=$HOME/Library/Android/sdk
export PATH=$PATH:$ANDROID_HOME/emulator
export PATH=$PATH:$ANDROID_HOME/platform-tools


# Added by Antigravity CLI installer
export PATH="/Users/home/.local/bin:$PATH"
