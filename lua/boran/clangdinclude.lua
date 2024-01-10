local M = {}

local function find_subdirectories(root)
    local dirs = {}
    for _, entry in ipairs(vim.fn.readdir(root)) do
        if entry ~= "." and entry ~= ".." then
            local path = root .. '/' .. entry
            if vim.fn.isdirectory(path) == 1 then
                table.insert(dirs, path)
                local subdirs = find_subdirectories(path)
                for _, subdir in ipairs(subdirs) do
                    table.insert(dirs, subdir)
                end
            end
        end
    end
    return dirs
end

-- Function to generate the .clangd file content
function M.generate_clangd_file()
    local clangd_content = "CompileFlags:\n\tAdd:\n"

    -- List of folders to include in .clangd
    local source_folders = {'src', 'include'}
	local included_folders = {}

    for _, source_folder in ipairs(source_folders) do
        local src_path = vim.fn.getcwd() .. '/' .. source_folder
        if vim.fn.isdirectory(src_path) == 1 then
			table.insert(included_folders, source_folder) 

			--add the dir itself
            local dir_unix = string.gsub(src_path, '\\', '/')
            clangd_content = clangd_content .. "      - -I" .. dir_unix .. "\n"

			--add the subdirs
            local subdirs = find_subdirectories(src_path)
            for _, subdir in ipairs(subdirs) do
                local subdir_unix = string.gsub(subdir, '\\', '/')
                clangd_content = clangd_content .. "      - -I" .. subdir_unix .. "\n"
            end
        else
            print("Warning: '" .. source_folder .. "' folder not found in the current directory.")
        end
    end

	--don't write a .clangd file if folders doesn't exist
	if #included_folders == 0 then
		print("\nError: Could not create .clangd file.")
		return
	end

    local clangd_file_path = vim.fn.getcwd() .. '/.clangd'
    local file = io.open(clangd_file_path, 'w')
    file:write(clangd_content)
    file:close()

    print("Generated .clangd file")
	print("Added folders: ")
	for _, included in ipairs(included_folders) do
		print("'" .. included .. "'")
	end
end

return M

