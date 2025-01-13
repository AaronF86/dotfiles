function fish_prompt
    # Get the current time in HH:MM format
    set current_time (date "+%H:%M")

    # Get the Git branch (if inside a Git repository)
    set git_branch (git rev-parse --abbrev-ref HEAD ^/dev/null; or echo "")
    if test -z "$git_branch"
        set git_branch ""
    end

    # Get the hostname of the system (useful for SSH connections)
    set ssh_host (hostname)

    # Get the current working directory
    set cwd (pwd)

    # Define box-drawing characters for the prompt
    set left_top_box '╭─'      # Top left corner of the box
    set left_bottom_box '╰─'    # Bottom left corner of the box
    set left_round ''          # Rounded left corner symbol
    set right_round ''         # Rounded right corner symbol
    set separator_line '─'      # Separator line for alignment

    # Define default symbol for the language (Nix logo)
    set sym "󱄅"  # Default Nix logo symbol

    # Check for specific language file types in the current directory using find (non-recursive)
    if test -n (find $cwd -maxdepth 1 -name '*.hs' -print -quit)
        set sym ""  # Haskell symbol
    else if test -n (find $cwd -maxdepth 1 -name '*.rs' -print -quit)
        set sym ""  # Rust symbol
    else if test -n (find $cwd -maxdepth 1 -name '*.java' -print -quit)
        set sym ""  # Java symbol
    end

    # Start building the first line: Display working directory, language symbol, time, and git branch (if available)
    echo -n (set_color magenta)$left_top_box
    echo -n (set_color blue)$left_round
    echo -n (set_color black)
    echo -n (set_color --background blue)"$sym  $cwd"  # Directory and language symbol
    echo -n (set_color --background normal)  # Reset to normal before right round
    echo -n (set_color blue)$right_round
    echo -n "──────────────────────────────────" # TODO: make dynamic
    echo -n (set_color yellow)$left_round
    echo -n (set_color black)(set_color --background yellow)
    echo -n (set_color black)"⏰ $current_time"  # Display current time

    # Show Git branch if inside a Git repository
    if test -n "  $git_branch"
        echo -n (set_color black)" 🧑‍💻 $git_branch"
    end

    # Show SSH host if available
    if test -n "  $ssh_host"
        echo -n (set_color black)" 🔗 $ssh_host" #TODO: make sure not on own device
    end
    echo -n (set_color --background normal)

    # New line after the first line to prepare for the second line
    echo

    # Start the second line with a moon emoji and a right arrow
    echo -n (set_color magenta)$left_bottom_box
    echo -n (set_color magenta)$left_round
    echo -n (set_color --background magenta)" "  # Moon emoji
    echo -n (set_color normal)  # Reset to normal before right round
    echo -n (set_color magenta)$right_round
    echo -n " -> "  # Right arrow to indicate the end of the prompt
end
