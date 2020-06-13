: 'git_command_line_interface
 ----------------------------------------
 (Q)uit   (C)lear
 (s)tatus (d)iff (l)og (g)raph
 # (A)dd    (u)ndo
 # (Co)mmit (U)ndo (R)edo
 # (+P)ush
 # (B)ranch (t)o (M)erge (D)elete  (st)ash
 ----------------------------------------
'

head -8 $0
# loop here
while true ; do
    echo -n ">>"
    read key
    case $key in
        "Q"|"exit") break      ;;
        "C") clear; head -8 $0 ;;
        "s") git status        ;;
        "d") git diff --staged ;;
        "l") git log --abbrev-commit --date=format:'%Y-%m-%d %H:%M:%S' --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Cblue %s %Cgreen(%cd) %C(bold blue)<%an>%Creset';;
        "g") git log --graph ;;
        # "A") git add .  ;;
        # "u")
        #     echo -e "\033[4mgit reset HEAD^\033[0m"
        #     git reset HEAD^
        #     echo -e "TIPS: git checkout -- {yourfile}" 
        #     ;;
        # "Co")
        #     echo -n "please give commit message: "
        #     read msg
        #     git commit -m"$msg"
        #     ;;
        # "U")
        #     echo -e "\033[4mgit reset --hard HEAD^\033[0m"
        #     git reset --hard HEAD^
        #     ;;
        # "R")
        #     echo -e "\033[4mgit reflog\033[0m"
        #     git reflog
        #     echo -n "commit id: "
        #     read dot
        #     git reset --hard $dot
        #     ;;
        # "+P")
        #     git push origin master
        #     ;;
        # "B")
        #     echo -n "new branch name: "
        #     read bname
        #     git branch $bname
        #     ;;
        # "t")
        #     git branch
        #     echo -n "to branch: "
        #     read bname
        #     git checkout $bname
        #     ;;
        # "M")
        #     git branch
        #     echo -n "merge branch to current branch: "
        #     read bname
        #     git merge $bname
        #     ;;
        # "D")
        #     git branch
        #     echo "use git branch -d {branch_name} delete branch"
        #     ;;
        # "st")
        #     echo "use (s)--stash (p)--stash pop (l)--list stash "
        #     read -n1 key
        #     echo
        #     case $key in
        #         "s") git stash      ;;
        #         "p") git stash pop  ;;
        #         "l") git stash list ;;
        #           *)                ;;
        #     esac
        #     ;;
        *)
            $key
            ;;
    esac
done

: '----------------------------------------
              git guide
 ----------------------------------------
 git add 把文件添加到仓库
 git commit -m "..." 把文件提交到仓库
 git reset --hard HEAD^  版本回退，HEAD^ 指向上个版本
 删除文件 git rm {yourfile}
 撤销修改
 其实是用版本库里的版本替换工作区的版本，
 无论工作区是修改还是删除，都可以“一键还原”。
 git checkout -- {yourfile}

 ~~~~~~~~~ remote guide ~~~~~~~~
 git remote add origin <your_git:account>
 错误提示：fatal: remote origin already exists.
 则使用 git remote rm origin
 git push origin master
 错误提示：error: failed to push some refs to
 错误原因：在推送前没有进行本地仓库和远程服务器的同步
 方法一 git push -f 强制推送，远端仓库被覆盖
 方法二 需先对本地和远程仓库进行整理合并
 git pull --rebase origin master
 git push -u origin master

'
