jQuery.extend slider: (k, p) ->
  m =
    slider: "<div id=\"slider\" style=\"position: relative; overflow: hidden\"></div>"
    wrapper: "<div id=\"sliderWrapper\" style=\"position: absolute;\"></div>"
    width: 221
    height: 335
    step: 0
    interval: 5000
    images: []

  i = $.extend({}, m, p)
  b = $("#" + k)
  d = $(i.slider)
  a = $(i.wrapper)
  e = i.width
  o = i.height
  f = i.interval
  h = (if i.step then i.step else e)
  n = i.images
  j = n.length
  g = ""
  c = 1
  l = 0

  while l < j
    g += "<img src=\"" + n[l] + "\" width=\"" + e + "\" height=\"" + o + "\" style=\"float:left;\" />"
    l++
  a.html(g).css
    width: e * j + j
    height: o

  d.css(
    width: e
    height: o
  ).append a
  b.append d
  setInterval (->
    if c is j
      a.animate left: 0
      c = 1
    else
      q = "-=" + h + "px"
      a.animate left: q
      c++
  ), f

$ ->
  j = document
  b = $("#features")
  c = 149
  f = c * 7
  g = true
  a = "en"
  e = location.pathname.match(/\/(\w+)\/(\w*)/i)
  h = []
  i = "/en/"
  a = e[1] or a  if e
  $("#feature_left").click ->
    if (a is "ar" or a is "he") and g and parseInt(b.css("left"), 10) < f
      g = false
      b.animate
        left: "+=" + c
      , ->
        g = true
      return
    else
      return  if a is "ar" or a is "he"
    if g and parseInt(b.css("left"), 10) < 0
      g = false
      b.animate
        left: "+=" + c
      , ->
        g = true


  $("#feature_right").click ->
    if (a is "ar" or a is "he") and g and Math.abs(parseInt(b.css("left"), 10) > 0)
      g = false
      b.animate
        left: "-=" + c
      , ->
        g = true

      return
    else
      return  if a is "ar" or a is "he"
    if g and Math.abs(parseInt(b.css("left"), 10)) < f
      g = false
      b.animate
        left: "-=" + c
      , ->
        g = true


  i = (if a is "zh_TW" then "/zh_TW/" else i)
  d = 1

  while d <= 3
    h.push i + "img/banner/slider" + d + ".png"
    d++
  $.slider "main",
    images: h


