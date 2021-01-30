window.onload = function(){
  document.getElementById('role').addEventListener('change', function() {
    var style = this.value == "Owner" ? 'block' : 'none';
    document.getElementById('hidden_div').style.display = style;
});
}