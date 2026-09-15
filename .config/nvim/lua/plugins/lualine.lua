return {
  {
    'nvim-lualine/lualine.nvim',
    dependencies = { 
      'nvim-tree/nvim-web-devicons',
      {'lewis6991/gitsigns.nvim', version = '*' },
    },
    --config = true,
    config = function()
      local mode_map = {
        ['n']    = 'N',
        ['no']   = 'O-PENDING',
        ['nov']  = 'O-PENDING',
        ['noV']  = 'O-PENDING',
        ['no�'] = 'O-PENDING',
        ['niI']  = 'N',
        ['niR']  = 'N',
        ['niV']  = 'N',
        ['nt']   = 'N',
        ['v']    = '',
        ['vs']   = 'V',
        -- ['V']    = 'V-L',
        ['V']    = '-V-',
        ['Vs']   = 'V-L',
        ['�']   = 'V-B',
        ['�s']  = 'V-B',
        ['s']    = 'S',
        ['S']    = 'S-L',
        ['�']   = 'S-B',
        -- ['i']    = '',
        ['i']    = '',
        ['ic']   = 'I',
        ['ix']   = 'I',
        ['R']    = 'R',
        ['Rc']   = 'R',
        ['Rx']   = 'R',
        ['Rv']   = 'V-R',
        ['Rvc']  = 'V-R',
        ['Rvx']  = 'V-R',
        -- ['c']    = '',
        ['c']    = ' ',
        ['cv']   = 'EX',
        ['ce']   = 'EX',
        ['r']    = 'RE',
        ['rm']   = 'MORE',
        ['r?']   = 'CONFIRM',
        ['!']    = 'SH',
        ['t']    = 'TERM',
      }

      local function tstop()
        return vim.bo.tabstop
      end

      local function diff_source()
        local gitsigns = vim.b.gitsigns_status_dict
        if gitsigns then
          return {
            added = gitsigns.added,
            modified = gitsigns.changed,
            removed = gitsigns.removed
          }
        end
      end

      -- local sysmon = require('sysmon').setup({
      --     update_interval = 2000,
      --     use_icons = true,
      -- })

      local function pkginfo()
        return require('package-info').get_status()
      end

      vim.cmd([[
      function! IsCocEnabled()
        return g:coc_enabled ? "coc on" : " "
      endfunction]])

      require('lualine').setup {
        options = {
          icons_enabled = true,
          theme = 'auto',
          component_separators = { left = '', right = '' },
          section_separators = { left = '', right = '' },
          disabled_filetypes = {
            statusline = {},
            winbar = {},
          },
          ignore_focus = {},
          always_divide_middle = true,
          globalstatus = false,
          refresh = {
            statusline = 1000,
            tabline = 1000,
            winbar = 1000,
          }
        },
        sections = {
          lualine_a = {function ()
              return mode_map[vim.api.nvim_get_mode().mode] or "__"
          end},
          lualine_b = { { 'b:gitsigns_head', icon = '' }, { 'IsLongLines' }},
          lualine_c = {
            { 'filename',
              shorting_target = 30,
              path = 1,
              symbols = {
                modified = '󰧞',
                readonly = '',
                unnamed = '[no name]',
                newfile = '[new]',
              }
            },
          },
          lualine_x = {
            { 'filetype',
              colored = false,   -- Displays filetype icon in color if set to true
              icon_only = false, -- Display only an icon for filetype
            },
            { tstop },
          },
          lualine_y = { 'progress' },
          lualine_z = { 'location' },
        },
        inactive_sections = {
          lualine_a = {},
          lualine_b = { { 'b:gitsigns_head', icon = '' }, { 'IsLongLines' }},
          lualine_c = {
            { 'filename',
              shorting_target = 30,
              path = 1,
              symbols = {
                modified = '󰧞',
                readonly = '',
                unnamed = '[no name]',
                newfile = '[new]',
              }
            },
          },
          lualine_x = {
            { 'filetype',
              colored = false,   -- Displays filetype icon in color if set to true
              icon_only = true, -- Display only an icon for filetype
            },
          },
          lualine_y = {},
          lualine_z = {}
        },
        tabline = {
          lualine_a = {
            {
              'diff',
              source = diff_source,
              --[[ diff_color = {
                added = 'DiffAdd',
                modified = 'DiffText',
                removed = 'DiffDelete',
              }, ]]
              symbols = {
                added = '',
                modified = ' ~', 
                removed = ' −'
              },
              color = {
                bg='#393552'
              },
              separator = { right = '', left = '' },
            }, 
          },
          lualine_b = {'buffers'},
          lualine_c = {
            {
              require("lazy.status").updates,
              cond = require("lazy.status").has_updates,
              color = { fg = "#ff9e64" },
            },
            { pkginfo },
          },
          lualine_x = {
            {
              'IsCocEnabled',
              'g:coc_enabled'
            },
            {
              'IsAleLintingNow',
              'g:ale_enabled'
            }
          },
          lualine_y = {
            { 'diagnostics',
              sources = { 'ale', 'coc' },
              sections = { 'error', 'warn', 'info' },
              symbols = {
                error = ' ',
                warn = ' ',
                -- info = ' ',
                info = ' ',
                -- hint = '󰆽 ',
                hint = ' ',
              },
              always_visible = false,
            },
          },
          lualine_z = {},
        },
        winbar = {},
        inactive_winbar = {},
        extensions = { 'fugitive', 'lazy' }
      }
    end,
  },
}
