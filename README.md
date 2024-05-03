# develop

[Tailwind installation](https://tailwindcss.com/docs/installation)

```
ormolu --mode inplace $(git ls-files '*.hs')

ghcid -r

npx tailwindcss -i ./input.css -o ./output.css --watch
```
