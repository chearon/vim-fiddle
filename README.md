# Requirements

* Neovim 0.2.0+
* (optional) `http-server` (`npm install -g http-server`)

# Installation

In your `init.vim` add:
```
Plugin 'chearon/vim-fiddle'
```

# Usage

[![asciicast](https://asciinema.org/a/Yqd9k8kCvYWwFaDP2SEuWkmyB.png)](https://asciinema.org/a/Yqd9k8kCvYWwFaDP2SEuWkmyB)

```bash
npm install -g http-server # if you want it to auto-host
nvim fiddle.html
```

Opens up 4 new buffers for you - on the left is the JS, and the HTML and CSS are on the right similar to JSFiddle. 
