# Begone, AI articles !

Have you ever had a simple code problem, formulated a search in your favourite engine, only to end up on a 500 words
long article with way too many sections and examples and somehow still they only barely brush the surface of the issue?  
You read it and reach the inevitable "Conclusion" part all these articles have and wish you could get your minute of your
life back, because of course it didn't help.  
Well, this list is here to fix that.

## Total erasure
This blocklist will not only block the sites in a way that prevents you giving trafic (and potentially ad revenue), it
will also cleanly remove their links from search results.  
Supported search engines:  
- [x] Google  
- [x] DuckDuckGo  
- [x] Yandex  

## How to use
Open uBlock Origin settings, go to `Filter Lists` tab, all the way at the bottom expand `Import...` and paste the
following link in the box:
```
https://raw.githubusercontent.com/SirWrexes/Begone-AI-Articles/refs/heads/main/begone.txt
```

## Aknowledgements

### [Huge AI blocklist](https://github.com/laylavish/uBlockOrigin-HUGE-AI-Blocklist)
Nice in theory but, in practice, the sheer quantity of sites with the use of `:upwwards():remove()` is quite suboptimal.  
If you want to use it with the more modern `:has()` approach, you can import the following list in your uBO settings:
```
https://raw.githubusercontent.com/SirWrexes/Begone-AI-Articles/refs/heads/main/huge.txt
```
