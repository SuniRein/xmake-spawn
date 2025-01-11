import("get_template_dir")

---Get the path of the specified template.
---@param template string The template name.
---@return string path The template path.
function main(template)
    if not template then
        raise("Please specify the template name.")
    end

    local template_dir = get_template_dir()

    local template_path = path.join(template_dir, template)
    if not os.isdir(template_path) then
        raise("The template does not exist: %s", template)
    end

    return template_path
end
