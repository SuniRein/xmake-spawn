import("core.base.option")
import("modules.get_template_path")
import("modules.get_templates")

function main()
    -- List all available templates
    if option.get("list") then
        local templates = get_templates()
        for _, template in ipairs(templates) do
            print(template)
        end
        return
    end

    local name = option.get("name")
    if not name then
        raise("Please specify the project name.")
    end

    local template_path = get_template_path(option.get("template"))

    local project_dir = path.join(os.curdir(), name)
    if os.isdir(project_dir) then
        raise("The project directory already exists: %s", project_dir)
    end

    if os.trycp(template_path, project_dir) then
        -- Initialize git repository
        os.cd(project_dir)
        os.run("git init")

        print("The project has been created: %s", project_dir)
    else
        raise("Failed to create the project: %s", project_dir)
    end
end
