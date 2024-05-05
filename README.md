# An example of HTML generation using lucid2

[lucid2 on Hackage](https://hackage.haskell.org/package/lucid2).

The HTML is served using a simple [wai](https://hackage.haskell.org/package/wai)
application, run with the [warp](https://hackage.haskell.org/package/warp) server.

## Development

For formatting:

```
ormolu --mode inplace $(git ls-files '*.hs')
```

Running in the background:

```
ghcid -r
```

To refresh the server every time the code changes. (Pending: how to auto-reload
the page?)

Also running in the background:

```
npx tailwindcss -i ./input.css -o ./output.css --watch
```

This is using the tailwind CLI to continuously watch the Haskell source file
(according to `tailwind.config.js`) and generate an `output.css` file that can
be linked from the page. See the docs for [Tailwind
installation](https://tailwindcss.com/docs/installation).