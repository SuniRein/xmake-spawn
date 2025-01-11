---Get template directory from environment variable.
---@return string
function main()
    local template_dir = os.getenv("XMAKE_SPAWN_TEMPLATEDIR")

    if not template_dir then
        raise("Please set the XMAKE_SPAWN_TEMPLATEDIR environment variable.")
    end

    if not os.isdir(template_dir) then
        raise("The template directory does not exist: %s", template_dir)
    end

    return template_dir
end
