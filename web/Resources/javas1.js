
document.getElementById('box1').onchange = function() {
document.getElementById('text1').disabled = !this.checked;
};
document.getElementById('box2').onchange = function() {
document.getElementById('text2').disabled = !this.checked;
document.getElementById('text4').disabled = !this.checked;
};
document.getElementById('box3').onchange = function() {
document.getElementById('text3').disabled = !this.checked;
};


