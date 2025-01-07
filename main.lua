import("core.base.option")

local function check_template_dir()
    local template_dir = os.getenv("XMAKE_SPAWN_TEMPLATEDIR")

    if not template_dir then
        raise("Please set the XMAKE_SPAWN_TEMPLATEDIR environment variable.")
    end

    if not os.isdir(template_dir) then
        raise("The template directory does not exist: %s", template_dir)
    end

    return template_dir
end

local function list_templates(template_dir)
    local templates = os.dirs(path.join(template_dir, "*"))
    if templates then
        for _, template in ipairs(templates) do
            print("%s", path.filename(template))
        end
    end
end

function main()
    local template_dir = check_template_dir()

    -- List all available templates
    if option.get("list") then
        list_templates(template_dir)
        return
    end

    local name = option.get("name")
    if not name then
        raise("Please specify the project name.")
    end

    local template = option.get("template")
    if not template then
        raise("Please specify the template name.")
    end

    local template_path = path.join(template_dir, template)
    if not os.isdir(template_path) then
        raise("The template does not exist: %s", template)
    end

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
