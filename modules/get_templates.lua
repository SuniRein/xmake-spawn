import("get_template_dir")

---Get all templates as an array.
---@return table paths
function main()
    local template_dir = get_template_dir()

    local template_paths = os.dirs(path.join(template_dir, "*"))

    local templates = {}
    for _, template_path in ipairs(template_paths) do
        table.insert(templates, path.filename(template_path))
    end

    return templates
end
