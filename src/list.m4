dnl -*- html -*-
define(__title, `All posts')dnl
include(src/header.html)
define(`for',`ifelse($#,0,``$0'',`ifelse(eval($2>=$3),1,
  `pushdef(`$1',$2)$4`'popdef(`$1')$0(`$1',decr($2),$3,`$4')')')')
define(`__year', esyscmd(`date "+%Y"'))dnl
<div id="list">
  <h2>__year</h2>
<ul>
for(`__i',__latest,1,
  `undefine(`__title') undefine(`__timestamp') undefine(`__keywords') divert(-1) include(src/__i.m4) divert(1)dnl
  ifelse(eval(__year), eval(substr(__timestamp, 0, 4)),,
                 `define(`__year', decr(eval(__year)))dnl
</ul>
<h2>__year</h2>
<ul>')dnl
  <li><a href="__i.html">__title</a> &ndash; <span class="timestamp">__timestamp</span></li>
')
</ul>
</div>
undefine(`__timestamp')
include(src/footer.html)
