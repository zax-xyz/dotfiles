require('img-clip').setup({
    embed_image_as_base64 = false,
    prompt_for_file_name = false,
    drag_and_drop = {
        insert_mode = true,
    },
})

require('render-markdown').setup({
    file_types = { "markdown", "Avante" },
})

require('snacks').setup()

require('avante').setup({
    provider = 'opencode',
    acp_providers = {
        ["opencode"] = {
            command = "opencode",
            args = { "acp" },
        },
    },
    behaviour = {
        enable_token_counting = false,
    },
})
