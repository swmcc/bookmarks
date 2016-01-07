# bookmarks 

**bookmarks**  */ˈbookˌmarks/*

*Noun:*  
A handy utility script for my urls that I want to keep a note of.

## Description

I don't like the interfaces for bookmarks that are about. I want
to have my own. 

There are multiple solutions that could have been used, however I
thought that going for the simplest solution would work best and then
if needed could be extended to include a more complex solution. 

I spend most of my time in the terminal. More often than not I will 
want to jump to a URL from there. Using the bookmarks syncing in chrome
doesn't really work for me - I simply wont use it.

So with that in mind I wanted a solution that I could use easy from the
terminal and that the actual links be backed-up some way. To my simple
mind bookmarks/links are just text, so why not have it in a text file?

This text file lives in [Dropbox](http://www.dropbox.com) and follows
the simple format of:

```
URL - TITLE - TIMESTAMP
```

I will no doubt extend this as I go on. This is just a simple project that
I ```hack``` on. It does not represent my best work, nor would I want it to.
More of a place that scratches an itch that I have and allows me to 
```check out``` into somewhere I can just add to while still being productive.

## Development Info

### Installtion

```
git clone git@github.com:swmcc/bookmarks.git 
cd bookmarks 
mkdir -p ~/bin # Make sure your $PATH knows about ~/bin
ln -s app.rb ~/bin/b
```

### Usage

#### add
Add a url and title to your bookmarks
```
b -u <url> -t <title>
```

#### search

Returns a list of bookmarks that have a search term of ```<search>```
```
b -s <search> 
```

#### tail

Returns the last ```n``` bookmarks added
```
b -n 5
```

### list

Returns all the bookmarks
```
b -l
```
