dnl -*- html -*-
define(__title, `Blog')dnl
define(__subtitle, `this is all the stuff I have written here')dnl
include(src/header.html)
define(`fordown',`ifelse($#,0,``$0'',`ifelse(eval($2>=$3),1,
  `pushdef(`$1',$2)$4`'popdef(`$1')$0(`$1',decr($2),$3,`$4')')')')
<div id="list">
<ul style="margin:0;">
fordown(`__i',__latest,1,
  `undefine(`__title') undefine(`__timestamp') undefine(`__keywords') undefine(`__subtitle') divert(-1) include(src/__i.m4) divert(1)dnl
<li style="list-style-type:none;margin:1em 0;text-transform:capitalize;"><a href="__i.html">__title</a><span class="timestamp" style="float:right;">__timestamp</span><br>__subtitle</li>')
</ul>
</div>
undefine(`__timestamp')
include(src/footer.html)
