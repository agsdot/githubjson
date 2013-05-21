$(document).ready(function() {
var button = document.getElementById('button');
var container = document.getElementById('container');

button.onclick = function () {
  // alert('hi');
  $.ajax({
  url: '/d3.json',
  method: 'get',
  dataType: 'json',
  success: function(data) {
    var svg = d3.select('div#container svg');
    var d3data = data;
    svg.selectAll('rect')
        .data(d3data)
        .enter()
        .append('rect')
        .attr('height', 30)
        .attr('width', 0)
        .transition()
        .duration(3000)
        .style('fill', 'red')
        .attr('width', function(value){
          return value * 6;
        })
        .attr('y', function(value, i){
          return i * 20;
        })
        .transition()
        .duration(3000)
        .style('fill', 'orange')
        .transition()
        .duration(3000)
        .attr("width", function(value){return value * 15;});
  }


  });
  };
});