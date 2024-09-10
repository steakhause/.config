if status is-interactive
    # Commands to run in interactive sessions can go here

    function clip --description 'Copy the contents of a file to the clipboard'
        if test (count $argv) -ne 1
            echo "Usage: clip <filename>"
            return 1
        end

        set filename $argv[1]

        if test -f $filename
            if test "$XDG_SESSION_TYPE" = "wayland"
                cat $filename | wl-copy
            else if test "$OSTYPE" = "darwin"
                cat $filename | pbcopy
            else
                cat $filename | xclip -selection clipboard
            end
            echo "File contents copied to clipboard"
        else
            echo "File not found: $filename"
            return 1
        end
    end

    function addToLauncher
        set -l name $argv[1]
        set -l exec_basename (basename $argv[2])
        set -l icon_basename (basename $argv[3])
        set desktop_file ~/.local/share/applications/$name.desktop
        echo "[Desktop Entry]" > $desktop_file
        echo "Version=1.0" >> $desktop_file
        echo "Type=Application" >> $desktop_file
        echo "Name=$name" >> $desktop_file
        echo "Comment=Launch $name" >> $desktop_file
        echo "Exec=/home/jason/Development/BashScripts/stream-pi/$exec_basename" >> $desktop_file
        echo "Icon=/home/jason/Pictures/icons/$icon_basename" >> $desktop_file
        echo "Terminal=false" >> $desktop_file
        echo "Categories=Utility;" >> $desktop_file
        chmod +x $desktop_file
        echo "Launcher entry created for $name"
    end


    function gcom --description 'alias gcom git commit -am'
        git commit -am $argv;
    end

    function gpull --description 'alias gpull git pull origin master'
        git pull origin master $argv;
    end

    function gstat --wraps='git status' --description 'alias gstat git status'
        git status $argv; 
    end

    function home --wraps='cd ~/Development' --description 'alias home cd ~/Development'
      cd ~/Development $argv; 
    end

    function run-updates --wraps='sudo flatpak -y upgrade; sudo apt update; sudo apt -y upgrade;' --description 'alias run-updates sudo flatpak -y upgrade; sudo apt update; sudo apt -y upgrade;'
      sudo flatpak -y upgrade; sudo apt update; sudo apt -y upgrade; $argv; 
    end

    function ssh@apiclever --wraps='ssh -p 2256 apiclever@69.167.176.95' --description 'alias ssh@apiclever ssh -p 2256 apiclever@69.167.176.95'
      ssh -p 2256 apiclever@69.167.176.95 $argv;
    end

    function ssh@host1 --wraps='ssh -p 2257 jason@192.168.0.102' --description 'alias ssh@host1 ssh -p 2257 jason@192.168.0.102'
        ssh -p 2257 jason@192.168.0.102 $argv; 
    end

    function ssh@host2 --wraps='ssh jason@192.168.0.106' --description 'alias ssh@host2 ssh jason@192.168.0.106'
      ssh jason@192.168.0.106 $argv; 
    end

    function ssh@host3 --wraps='ssh jason@192.168.0.107' --description 'alias ssh@host3 ssh jason@192.168.0.107'
      ssh jason@192.168.0.107 $argv; 
    end

    function ssh@host4 --wraps='ssh jason@192.168.0.110' --wraps='ssh -p 12222 jason@192.168.0.110' --wraps='ssh -p 12222 jason@192.168.66.2' --wraps='ssh jason@192.168.0.10' --description 'alias ssh@host4 ssh jason@192.168.0.10'
      ssh jason@192.168.0.10 $argv; 
    end

    function ssh@homeassistant --wraps='ssh root@10.0.10.3' --description 'alias ssh@homeassistant ssh root@10.0.10.3'
      ssh root@10.0.10.3 $argv; 
    end

    function ssh@nas --wraps='ssh root@192.168.0.105' --description 'alias ssh@nas ssh root@192.168.0.105'
      ssh root@192.168.0.105 $argv; 
    end

    function ssh@learn.clever --wraps='ssh ntclrenuk@69.167.176.34' --description 'alias ssh@learn.clever ssh ntclrenuk@69.167.176.34'
      ssh ntclrenuk@69.167.176.34 $argv; 
    end

    function ssh@test.learn.clever --wraps='ssh devcrt4@69.167.176.34' --description 'alias ssh@test.learn.clever ssh devcrt4@69.167.176.34'
      ssh devcrt4@69.167.176.34 $argv; 
    end

    function ssh@root-learn --wraps='ssh -t root@69.167.176.34 "fish"' --description 'alias ssh@root-learn ssh -t root@69.167.176.34 "fish"'
      ssh -t root@69.167.176.34 "fish" $argv; 
    end

    function ssh@root-clever --wraps='ssh -t -p 2256 root@69.167.176.95 "fish"' --description 'alias ssh@root-clever ssh -t -p 2256 root@69.167.176.95 "fish"'
      ssh -t -p 2256 root@69.167.176.95 "fish" $argv; 
    end

    function xopen --wraps='xdg-open ' --description 'alias xopen xdg-open '
      xdg-open  $argv; 
    end

end
