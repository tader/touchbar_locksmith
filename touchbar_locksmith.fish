function touchbar_locksmith
    if set match (string match -r -i 'F(\d+)' $argv[1])
        set -g TOUCHBAR_LOCKSMITH_KEY $match[2]
    else
        echo "usage: touchbar_locksmith <Fn KEY>"
        echo "  eg.: touchbar_locksmith F2"
        return 1
    end

    touchbar # make sure it is initialized

    fish_prompt_touchbar_locksmith
end
