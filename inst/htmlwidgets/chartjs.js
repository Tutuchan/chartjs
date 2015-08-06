HTMLWidgets.widget({

  name: 'chartjs',

  type: 'output',

  initialize: function(el, width, height) {
    return {};
  },

  renderValue: function(el, x, instance) {

    helpers = Chart.helpers;

    var datasets = [];

    for (i = 0, len = x.y.length; i < len; i ++){
      datasets.push({
          label: x.labels[i],
          strokeColor: x.colors.strokeColor[i],
          fillColor: x.colors.fillColor[i],
          highlightStroke: x.colors.highlightStroke[i],
          highlightFill: x.colors.highlightFill[i],
          pointColor: x.colors.pointColor[i],
          pointStrokeColor: x.colors.pointStrokeColor[i],
          pointHighlightFill: x.colors.pointHighlightFill[i],
          pointHighlightStroke: x.colors.pointHighlightStroke[i],
          data: x.y[i]
      });
    }

    console.log(datasets);

    var data  = {
      labels: x.x,
      datasets: datasets
    };
    var canvas = document.getElementById(el.id);
    var ctx = canvas.getContext("2d");

    if (x.type === "Bar"){
      outChart = new Chart(ctx).Bar(data);
    } else if (x.type === "Line"){
      outChart = new Chart(ctx).Line(data, {
        responsive : true,
        animation: true,
        multiTooltipTemplate: "<%= datasetLabel %> - <%= value %>"
      });
    }

    // Generate legend and add mouseover event
    var legendHolder = document.createElement('div');
    legendHolder.innerHTML = outChart.generateLegend();


    if (x.type === "Bar"){
      // When the series is mouseovered in the legend, highlight the corresponding bars
      helpers.each(legendHolder.firstChild.childNodes, function(legendNode, index){
  			helpers.addEvent(legendNode, 'mouseover', function(){
  				var activeBars = outChart.datasets[index].bars;
  				for (var barsIndex = 0; barsIndex < activeBars.length; barsIndex++) {
    				var activeBar = activeBars[barsIndex];
    				activeBar.save();
    				activeBar.fillColor = activeBar.highlightFill;
    				activeBar.strokeColor = activeBar.highlightStroke;
  				}
  				outChart.draw();
  			});
  		});
  		// Remove highlight after mouseout
  		helpers.each(legendHolder.firstChild.childNodes, function(legendNode, index){
  			helpers.addEvent(legendNode, 'mouseout', function(){
    			var activeBars = outChart.datasets[index].bars;
    			for (var barsIndex = 0; barsIndex < activeBars.length; barsIndex++) {
      			var activeBar = activeBars[barsIndex];
      			activeBar.restore();
    			}
    			outChart.draw();
  			});
  		});
    }

    canvas.parentNode.appendChild(legendHolder.firstChild);




  },

  resize: function(el, width, height, instance) {
    if (outChart)
      outChart.resize();
  }

});
