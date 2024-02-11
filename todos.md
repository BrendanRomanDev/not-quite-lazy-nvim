# Todo / QOL enhancements

- [✓] env.local / env.development etc should be formatted and syntax highlit
  properly (.example shouldn't however)
- [✓] Eslint errors not being fixed on format
- [✓] Inline diagnostics annoying
- [✓] Add GPT
- [✓] Red error text background is too harsh. Make pink or something
- [ ] Inline **git** blame, or adjust ghb to be a better use experience. I
      really liked gitblame tool in my pre-rolled, allowed opening
- [ ] DelMarks command, figure out how to wipe all marks and make it more convenient?
- [ ] cool-substitute: Before, i could just hit gm or gM, which would allow me
      to make a change and then edit next ones. now, i have to hit <leader>cr and it's lame.

- [⧖] Markdown QOL stuff:

  - [✓] Headlines annoying white box, fix colors
  - [✓] Conceal level on links is really annoying
  - [✓] Get rid of folds on `<leader>f`, causes error
  - [✓] gy mapping is off. should be go-to type definition.. is surround
    related
  - [✓] Telekasten Tag Search, fix plugin and vault switch
  - [✓] Enter creates link, super annoying
  - [ ] Fix Telekasten Whichkey
  - [ ] Telekasten vault switching overrides filetype.. can you just make
        autocommand to set it back...
  - [ ] Paste image in obsidian not working ?

- [ ] Whichkey edits:
  - [ ] [Too](2024-01-23_too.md) much info showing...
  - [ ] Can you create a mapping to toggle which info shows?
  - [ ] Maybe edit which_key delay to take longer to pop up (timeoutlen) Or put it on a keymap?
  - [ ] gd doesn't show in whichkey (go to definition ?)

# Fun Challenges

- [ ] Create fn to override / delete all default keymaps for a pluign.. then
      you can add your own.
- [ ] Get Telekasten and Obsidian 'talking', maybe connect lua-line to show
      what workspace you're in?
- [ ] Make simple telescope finder for #tags in your chosen vault.
