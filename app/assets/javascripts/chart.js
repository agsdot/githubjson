$(document).ready(function() {
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
        .duration(2000)
        .attr('width', function(value){
          return value * 4;
        })
        .attr('y', function(value, i){
          return i * 20;
        });
  }


  });
});