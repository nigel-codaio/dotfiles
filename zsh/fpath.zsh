#add each topic folder to fpath so that they can add functions and completion scripts
for topic_folder ($ZSH/*); do
    if [ -d $topic_folder ]; then  
        fpath=($topic_folder $fpath)
    fi
done

if [ -d "$ZSH/local-dotfiles" ]; then
    for topic_folder ($ZSH/local-dotfiles/*); do
        if [ -d $topic_folder ]; then 
            fpath=($topic_folder $fpath);
        fi
    done
fi
