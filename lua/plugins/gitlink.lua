return {
  'juacker/git-link.nvim',
  opts = {
    url_rules = {
      {
        pattern = '^ssh://git@bit([^:]+):22/([^/]+)/(.+).git$',
        replace = 'https://bit%1/projects/%2/repos/%3/browse',
        format_url = function(base_url, params)
          -- Uppercase the project name in the base_url
          base_url = base_url:gsub('/projects/([^/]+)/', function(project)
            return '/projects/' .. project:upper() .. '/'
          end)
          if params.start_line == params.end_line then
            return string.format('%s/%s#%d', base_url, params.file_path, params.start_line)
          else
            return string.format('%s/%s#%d', base_url, params.file_path, params.start_line)
          end
        end,
      },
    },
  },
  keys = {
    {
      '<leader>gu',
      function()
        require('git-link.main').copy_line_url()
      end,
      desc = 'Copy code link to clipboard',
      mode = { 'n', 'x' },
    },
  },
}
