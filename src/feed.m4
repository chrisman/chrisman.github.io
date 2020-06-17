<?xml version="1.0" ?>
<rss version="2.0">
  <channel>
    <title>chrisman.github.io</title>
    <link>https://chrisman.github.io/</link>
    <description>chrisman blog</description>
define(__feed)dnl
define(`fordown',`ifelse($#,0,``$0'',`ifelse(eval($2>=$3),1,
    `pushdef(`$1',$2)$4`'popdef(`$1')$0(`$1',decr($2),$3,`$4')')')')
dnl The obvious thing here would be to define <, >, and & as macros.
dnl Sadly those are not valid macro names according to m4.
fordown(`__i',__latest,eval(__latest-10),`
    syscmd(m4 -D__feed src/__i.m4 | pandoc -f markdown -t html | sed "s/\&/\&amp;/g;s/>/\&gt;/g;s/</\&lt;/g")')
  </channel>
</rss> 
