local ls = require 'luasnip'
local ps = ls.parser.parse_snippet

ls.add_snippets('markdown', {
  ps({ trig = 'arr', name = 'Right Arrow', dscr = '→ symbol' }, '→'),
  ps({ trig = 'arrdown', name = 'Down Arrow', dscr = '↓ symbol' }, '↓'),
  ps({ trig = 'arrup', name = 'Up Arrow', dscr = '↑ symbol' }, '↑'),
  ps({ trig = 'blue', name = 'Blue Span', dscr = 'Blue text wrapper' }, '<span class="blue">$0</span>'),
  ps({ trig = 'red', name = 'Red Span', dscr = 'Red text wrapper' }, '<span class="red">$0</span>'),
  ps({ trig = 'yellow', name = 'Yellow Span', dscr = 'Yellow text wrapper' }, '<span class="yellow">$0</span>'),
  ps({ trig = 'green', name = 'Green Span', dscr = 'Green text wrapper' }, '<span class="green">$0</span>'),
  ps({ trig = 'purple', name = 'Purple Span', dscr = 'Purple text wrapper' }, '<span class="purple">$0</span>'),
  ps({ trig = 'orange', name = 'Orange Span', dscr = 'Orange text wrapper' }, '<span class="orange">$0</span>'),
  ps({ trig = 'center', name = 'Center Block', dscr = 'Center‑aligned span' }, '<span class="center-menu">$0</span>'),
  ps({ trig = 'right', name = 'Right Block', dscr = 'Right‑aligned span' }, '<span class="right-menu">$0</span>'),
  ps({ trig = 'left', name = 'Left Block', dscr = 'Left‑aligned span' }, '<span class="left-menu">$0</span>'),
  ps({ trig = 'subtitle', name = 'Subtitle', dscr = 'Subtitle span' }, '<span class="subtitle">$0</span>'),
  ps({ trig = 'indent', name = 'Indent', dscr = 'Two NBSP indent' }, '  $0'),
  ps({ trig = 'underline', name = 'Underline', dscr = 'Underline text' }, '<u>$0</u>'),
  ps({ trig = 'iframe', name = 'IFrame', dscr = 'Embed iframe' }, '<iframe src="$0" width="100%" height="500"></iframe>'),
  ps({ trig = 'vd', name = 'Vertical Dots', dscr = '⁝ symbol' }, '⁝'),
  ps({ trig = 'won', name = 'Won Symbol', dscr = '₩ symbol' }, '₩'),
  ps({ trig = 'hoff', name = 'Headings Off', dscr = 'Add number headings off setting to YAML' }, 'number headings: off$0'),

  -- Math
  ps({ trig = 'mk', snippetType = 'autosnippet', wordTrig = true }, '$${1}$$0'),
  ps(
    { trig = 'dm', snippetType = 'autosnippet', wordTrig = true },
    [[$$
$0
$$]]
  ),
})
