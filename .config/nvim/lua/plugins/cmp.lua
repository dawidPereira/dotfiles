return {
  {
    "hrsh7th/nvim-cmp",
    dependencies = { "hrsh7th/cmp-emoji" },
    opts = function(_, opts)
      -- Insert emoji source
      table.insert(opts.sources, { name = "emoji" })

      -- Customize window appearance
      opts.window = {
        completion = {
          border = "single", -- Regular square border
          winhighlight = "Normal:@punctation,FloatBorder:@ibl.whitespace.char.1,Search:None,PmenuSel:@comment,CursorLine:@comment.error",
        },
        documentation = {
          border = "single", -- Single border
          winhighlight = "Normal:@punctation,FloatBorder:@ibl.whitespace.char.1,Search:None,PmenuSel:@comment,CursorLine:@comment.error",
        },
      }
    end,
  },
}
