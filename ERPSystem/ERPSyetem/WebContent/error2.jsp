<%@ page language="java" pageEncoding="GBK"%>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>

<meta name="viewport" content="initial-scale=1, maximum-scale=1, user-scalable=no">
<title>404</title>

<style type="text/css">
html, body{overflow:hidden;margin:0;background:#000;}
body{font-family:'Open Sans', 'Helvetica Neue', 'Hiragino Sans GB', 'LiHei Pro', Arial, sans-serif;color:#333;}
#wrapper{position:absolute;left:0;width:320px;text-align:center;top:50%;left:50%;margin-left:-160px;margin-top:-160px;-webkit-user-select:none;-moz-user-select:none;user-select:none;}
h1{font-family:'Montserrat', 'Helvetica Neue', Arial, sans-serif;font-weight:700;font-size:30px;letter-spacing:9px;text-transform:uppercase;color:#eee;margin:12px 0;left:4px;}
h2{color:#999;font-weight:normal;font-size:15px;letter-spacing:.12em;margin-bottom:30px;left:3px;}
h1, h2{position:relative;}
p{font-size:14px;line-height:2em;margin:0;letter-spacing:2px;}
canvas{position:absolute;top:0;left:0;z-index:0;width:100%;height:100%;pointer-events:none;}
a{color:#999;text-decoration:none;transition:color .2s ease;}
a:hover{color:#f33;}
</style>



</head><body style="background-color: #F5F5F5">

<script type="text/javascript" src="./js/jquery.min.js"></script>

<div id="wrapper">
	<h1>404</h1>
	<h2>Sorry!你要找的页面走丢了...</h2>
	<p><a href="javascript:history.back(-1)" target="_blank">返回上一页</a></p>
</div>


<canvas width="1920" height="917"></canvas>

<script type="text/javascript">
document.addEventListener('touchmove', function (e) {
	e.preventDefault()
})
var c = document.getElementsByTagName('canvas')[0],
	x = c.getContext('2d'),
	pr = window.devicePixelRatio || 1,
	w = window.innerWidth,
	h = window.innerHeight,
	f = 90,
	q,
	m = Math,
	r = 0,
	u = m.PI*2,
	v = m.cos,
	z = m.random
c.width = w*pr
c.height = h*pr
x.scale(pr, pr)
x.globalAlpha = 0.6
function i(){
	x.clearRect(0,0,w,h)
	q=[{x:0,y:h*.7+f},{x:0,y:h*.7-f}]
	while(q[1].x<w+f) d(q[0], q[1])
}
function d(i,j){   
	x.beginPath()
	x.moveTo(i.x, i.y)
	x.lineTo(j.x, j.y)
	var k = j.x + (z()*2-0.25)*f,
		n = y(j.y)
	x.lineTo(k, n)
	x.closePath()
	r-=u/-50
	x.fillStyle = '#'+(v(r)*127+128<<16 | v(r+u/3)*127+128<<8 | v(r+u/3*2)*127+128).toString(16)
	x.fill()
	q[0] = q[1]
	q[1] = {x:k,y:n}
}
function y(p){
	var t = p + (z()*2-1.1)*f
	return (t>h||t<0) ? y(p) : t
}
document.onclick = i
document.ontouchstart = i
i()
</script>

<script type="text/javascript">
var snow = function() {
if(1==1) {
$("body").append('<canvas id="christmasCanvas" style="top: 0px; left: 0px; z-index: 5000; position: fixed; pointer-events: none;"></canvas>');
var b = document.getElementById("christmasCanvas"), a = b.getContext("2d"), d = window.innerWidth, c = window.innerHeight;
b.width = d;
b.height = c;
for(var e = [], b = 0;b < 70;b++) {
e.push({x:Math.random() * d, y:Math.random() * c, r:Math.random() * 4 + 1, d:Math.random() * 70})
}
var h = 0;
window.intervral4Christmas = setInterval(function() {
a.clearRect(0, 0, d, c);
a.fillStyle = "rgba(255, 255, 255, 0.6)";
a.shadowBlur = 5;
a.shadowColor = "rgba(255, 255, 255, 0.9)";
a.beginPath();
for(var b = 0;b < 70;b++) {
var f = e[b];
a.moveTo(f.x, f.y);
a.arc(f.x, f.y, f.r, 0, Math.PI * 2, !0)
}
a.fill();
h += 0.01;
for(b = 0;b < 70;b++) {
if(f = e[b], f.y += Math.cos(h + f.d) + 1 + f.r / 2, f.x += Math.sin(h) * 2, f.x > d + 5 || f.x < -5 || f.y > c) {
e[b] = b % 3 > 0 ? {x:Math.random() * d, y:-10, r:f.r, d:f.d} : Math.sin(h) > 0 ? {x:-5, y:Math.random() * c, r:f.r, d:f.d} : {x:d + 5, y:Math.random() * c, r:f.r, d:f.d}
}
}
}, 70)
}
}
snow();
</script><canvas id="christmasCanvas" style="top: 0px; left: 0px; z-index: 5000; position: fixed; pointer-events: none;" width="1920" height="917"></canvas>


<script type="text/javascript" src="js/forbidTab.js"></script>
<script type="text/javascript" src="js/jquery.min.js"></script>
<script type="text/javascript">$(function () {timer=setTimeout(function () {$("#msg1").css('display','none');}, 3000);})</script>
</body></html>