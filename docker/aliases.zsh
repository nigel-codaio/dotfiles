function docker_clean_images() {
    arg=$1
    if [ "$arg" = "-n" ]; then
        dry_run=true
    fi

    images=$(docker images -a --filter=dangling=true -q)

    if [ -z "$images" ]; then
        echo "No images to delete"
    elif [ "$dry_run" = true ]; then
        echo "Dry run. Would remove:"
        echo "$images"
    else
        echo "Didn't work. dry_run is $dry_run"
        #docker rmi "$images"
    fi
}

alias docker_delete_all='docker rmi $(docker images -a -q)'
