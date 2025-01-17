task("spawn", function()
    set_category("plugin")

    on_run("main")

    set_menu({
        usage = "xmake spawn [project]",
        description = "Spawn a new project from the given template.",
        options = {
            { "l", "list", "k", nil, "List all available templates." },
            {
                "t",
                "template",
                "kv",
                nil,
                "The template name.",
                values = function(complete, opt)
                    return import("modules.get_templates")()
                end,
            },
            {},
            { nil, "name", "v", nil, "The project name." },
        },
    })
end)
