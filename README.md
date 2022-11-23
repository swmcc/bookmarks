# Links

**links**  */lɪŋks/*

*Noun:*
a golf course, especially one on grass-covered sandy ground near the sea.

*Synonyms:*	
connection, relate, join, bracket

![Links](img/links.png "Links")

## Description

I want to have a list of my bookmarks or sites I want to read at a later stage
all in one place. I have been doing this for years and it was a very simple
setup, click [here](https://github.com/swmcc/links) to see it.

Times have changed though, my current work wont allow me to have a Dropbox
link in my home directory. Therefore making the above solution useless. 

My main use case is being able to add and view links easily in the terminal.
While porting this solution I thought it would be good to add a web front end
and add tagging etc. I haven't written down a plan yet but will link to it
when it is written. In the meantime you can get a grasp of future development
by looking at the [issue list](https://github.com/swmcc/bookmarks/issues).

It was hosted on [Heroku](https://www.heroku.com) when they were offering 
the free tier. I am now on their hobby tier to run this. I might move at 
some point - I will see what happens.

The command line tool that consumes this app will be released soon and will
be linked here.

## Links

- [live](http://links.swm.cc/) 
- [local](http://localhost:3000) 


## Development Info

Look at the [Makefile](https://github.com/swmcc/bookmarks/blob/main/Makefile)
for a more comprehensive development tasks. Here is a list of the basic
elements you will need.

### Personas

#### Admin

email:  admin@swm.cc 
password: pass5577

#### User 

email:  user@swm.cc 
password: pass5577

### Install

```
git clone git@github.com:swmcc/bookmarks.git
cd bookmarks 
make local.setup
```

### Run
```make local.run```

### Tests

```make local.tests```

