<?xml version="1.0" ?>
<rss version="2.0" xmlns:atom="http://www.w3.org/2005/Atom">
  <channel>
    <atom:link href="https://chrismanbrown.gitlab.io/rss.xml" rel="self" type="application/rss+xml" />
    <title>chrismanbrown.gitlab.io</title>
    <link>https://chrismanbrown.gitlab.io/</link>
    <description>chrisman blog</description>
define(__feed)dnl
define(`fordown',`ifelse($#,0,``$0'',`ifelse(eval($2>=$3),1,
    `pushdef(`$1',$2)$4`'popdef(`$1')$0(`$1',decr($2),$3,`$4')')')')
define(`formatter',`gdate -d $1 -R')
dnl The obvious thing here would be to define <, >, and & as macros.
dnl Sadly those are not valid macro names according to m4.
fordown(`__i',__latest,1,
  `undefine(`__title') undefine(`__subtitle') undefine(`__timestamp') divert(-1) include(src/__i.m4) divert(1)dnl
<item>
  <title>__title</title>
  <description>__subtitle</description>
  <link>https://chrismanbrown.gitlab.io/__i.html</link>
  <guid>https://chrismanbrown.gitlab.io/__i.html</guid>
  <pubDate>esyscmd(formatter(__timestamp))</pubDate>
</item>')
  </channel>
</rss> 
