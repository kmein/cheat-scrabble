# cheat-scrabble
*The uncreatively named scrabble cheater* inspired by [@archer884](https://www.youtube.com/watch?v=RIFukkGWIhM).

The cheater takes the letters you got on your Scrabble rack as command line
arguments. It will then spit out all words that can be made using these letters.
By default, it uses `/usr/share/dict/words` as a dictionary, an alternative
dictionary, however, can be specified in the `DICT` environment variable like
so:

```
$ DICT=my-cool-dict.txt ./cheat-scrabble.hs sgtndbro
```

Have fun cheating!

## Execution
If you have [Stack](https://www.haskellstack.org/) installed, you can just
`chmod +x` the Haskell source file and run it.
