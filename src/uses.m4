define(__title, `uses')
define(__subtitle, `stuff I use')
define(__timestamp, `2020-01-10')
include(src/header.html)
changequote(<!,!>)dnl Or else `code blocks` confuse m4

Also see: <https://github.com/wesbos/awesome-uses>

## Editor and Terminal

- my "terminal stack": neovim + tmux + zsh ([ohmyzsh][1]) + Terminal.app

- configs: my [dotfiles][2]

- colors:

    - term: [birds of paradise][3] (or something else from that repo)

    - vim: none, actually. I just `set background=dark` and leave it with the
      defaults, believe it or not.

- font: [Fira Code][4]. mmmmm, ligatures

[1]: https://ohmyz.sh/
[2]: https://github.com/chrisman/dotfiles
[3]: https://github.com/lysyi3m/macos-terminal-themes#birdsofparadise
[4]: https://github.com/tonsky/FiraCode/

## Desktop Apps

- Browser: Firefox

    - [vimium][5]
    - keepassxc-browser
    - [ublock-origin][6])

- Passwords: [keepassxc][7]

- Communication: Slack

- Dropbox: I keep a few files synced across a few devices. Chiefly my keepass
  file. Vaguely dissatisfied with Dropbox as a solution at the moment because
  of its device limitations. Perhaps I can use Keybase?

- [Spectacle][8]: the minimum acceptable amount of window management. Criminal
  that it's missing from MacOS as a default. 2020 goals: might check out
  [chunkwm / yabai][9]

[5]: https://addons.mozilla.org/en-US/firefox/addon/vimium-ff/
[6]: https://github.com/gorhill/uBlock
[7]: https://keepassxc.org/
[8]: https://github.com/eczarny/spectacle
[9]: https://github.com/koekeishiya/chunkwm

## Webapps

- gmail / google calendar

- GitHub? Does that count as a webapp? I spend a lot of time on GitHub.

## Gear

I am unsatisfied with the current state of the macbook. The keyboard is crappy,
the touchbar is crappy. I at the very least want to switch out my personal
computer this year.

- work computer: MacBook Pro (15-inch, 2018)

- personal computer: MacBook

- keyboard

    - [kinesis freestyle2 (mac)][10]

    - layout: [colemak][11]. I've been colemaking for years now, and give it
      100% credit for eliminating my wrist pain. I have successfully converted
      two coworkers to fulltime colemak. Downsides: I can no longer type
      qwerty. Upsides: colemak is everywhere so I never have to type qwerty.

- desk: I have a nice stand up desk, but I honestly spend +90% of my time lounging in this [IKEA chair][12]

[10]: https://www.amazon.com/Freestyle2-Ergonomic-Keyboard-Standard-Separation/dp/B00CMALD3E
[11]: https://colemak.com/
[12]: https://www.amazon.com/Ikea-Armchair-Footstool-Machine-Washable/dp/B0069B1KTO/ref=sr_1_5?crid=1ECMMT9ODUC05

changequote`'dnl change quotes `back to default'
include(src/footer.html)
