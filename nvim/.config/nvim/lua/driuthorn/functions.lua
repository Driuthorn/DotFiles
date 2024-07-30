local M = {}

local function builder_get_configs()
    local command = ''
    local currentBuffer = 0
    local filePath = vim.api.nvim_buf_get_name(currentBuffer)
    local fileType = vim.bo.filetype

    if fileType == 'rust' then
        command = ':! cargo build ' .. filePath
    elseif 'cs' then
        command = ':! dotnet build ' .. filePath
    end

    return command
end

function M.RunTest()
    local command = builder_get_configs()

    if command ~= '' then
        vim.cmd(command)
    else
        print("Not Buildable Project!")
    end
end

function M.RunProject(fileType)
    local command = ""
    local success = true

    if fileType == 'rust' then
        command = ":!cargo run"
    elseif fileType == 'cs' then
        command = ":!dotnet run"
    else
        success = false
    end

    return command, success
end

function M.buildProject(fileType)
    local command = ""
    local success = true

    if fileType == 'rust' then
        command = ":!cargo build"
    elseif fileType == 'cs' then
        command = ":!dotnet build"
    else
        success = false
    end

    return command, success
end

function M.cleanProject(fileType)
    local command = ""
    local success = true

    if fileType == 'rust' then
        command = ":!cargo clean"
    elseif fileType == 'cs' then
        command = ":!dotnet clean"
    else
        success = false
    end

    return command, success
end

return M
