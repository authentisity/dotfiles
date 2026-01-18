return {
    "https://github.com/lewis6991/gitsigns.nvim.git",
    
    config = function()
        require('gitsigns').setup {
            attach_to_untracked = true
        }
    end
}
