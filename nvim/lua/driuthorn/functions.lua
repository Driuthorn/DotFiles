local M = {}

function M.RunProject(fileType)
    local command = ""
    local success = true

    if fileType == 'rust' then
        command = "!cargo run"
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
    else
        success = false
    end

    return command, success
end

return M
