function ga
  git add $argv
end

function gaa
  git add --all $argv
end

function gapa
  git add --patch $argv
end

function gb
  git branch $argv
end

function gc
  git commit -v $argv
end

function gco
  git checkout $argv
end

function gcom
  git checkout master $argv
end

function gcob
  git checkout -b $argv
end

function gd
  git diff $argv
end

function gds
  git diff --staged $argv
end

function gfo
  git fetch origin $argv
end

function gl
  git pull $argv
end

function glo
  git log --oneline --decorate $argv
end

function glog
  git log --oneline --decorate --graph $argv
end

function glol
  git log --graph \
          --abbrev-commit \
          --pretty='%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' \
          $argv
end

function glola
  git log --graph \
          --abbrev-commit \
          --all \
          --pretty='%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' \
          $argv
end

function gp
  git push $argv
end

function gr
  git rebase $argv
end

function gra
  git rebase --abort $argv
end

function grc
  git rebase --continue $argv
end

function grom
  git rebase origin/master $argv
end

function gst
  git status $argv
end
