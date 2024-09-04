function _G.reloadConfig()
  for name, _ in pairs(package.loaded) do
    if name:match('^config') and not name:match('lazy$') then
      vim.notify('Reloading ' .. name, vim.log.levels.INFO)

      package.loaded[name] = nil
    end
  end

  dofile(vim.env.MYVIMRC)

  vim.notify('Nvim configuration reloaded!', vim.log.levels.INFO)
end
