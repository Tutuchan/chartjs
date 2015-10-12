HTMLWidgets.widget({

  name: 'chartjs',

  type: 'output',

  initialize: function(el, width, height) {
    return {};
  },

  renderValue: function(el, x, instance) {

    helpers = Chart.helpers;

    var datasets = [];
    var data = [];
    switch(x.type){
      case "Bar":
      case "Line":
      case "Radar":
        for (i = 0, len = x.data.length; i < len; i ++){
          datasets.push({
              label: x.dataLabels[i],
              borderColor: x.colors.borderColor[i],
              backgroundColor: x.colors.backgroundColor[i],
              pointBorderColor: x.colors.pointBorderColor[i],
              pointBackgroundColor: x.colors.pointBackgroundColor[i],
              pointHoverBorderColor: x.colors.pointHoverBorderColor[i],
              pointHoverBackgroundColor: x.colors.pointHoverBackgroundColor[i],
              data: x.data[i]
          });
        }
        data  = {
          labels: x.labels,
          datasets: datasets
        };
        break;
      case "Pie":
      case "Doughnut":
      case "PolarArea":
        for (i = 0, len = x.data.length; i < len; i ++){
          datasets.push({
              label: x.dataLabels[i],
              borderColor: x.colors.borderColor[i],
              backgroundColor: x.colors.backgroundColor[i],
              hoverBorderColor: x.colors.hoverBorderColor[i],
              hoverBackgroundColor: x.colors.hoverBackgroundColor[i],
              data: x.data[i]
          });
        }
        data = datasets;
        break;
    }

    console.log(data);
    var canvas = document.getElementById(el.id);
    var ctx = canvas.getContext("2d");
    var chartOptions = x.options;

    switch(x.type){
      case "Bar":
        outChart = new Chart(ctx, {
          type: 'bar',
          data: data,
          options: chartOptions
          });
      break;
      case "Line":
        outChart = new Chart(ctx, {
          type: 'line',
          data: data,
          options: chartOptions
        });
      break;
      case "Radar":
        outChart = new Chart(ctx, {
          type: 'radar',
          data: data,
          options: chartOptions
        });
      break;
      case "Pie":
        outChart = new Chart(ctx, {
          type: 'pie',
          data: data,
          options: chartOptions
        });
      break;
      case "PolarArea":
        outChart = new Chart(ctx, {
          type: 'polararea',
          data: data,
          options: chartOptions
        });
      break;
    }
    console.log(outChart);

    // Generate legend and add mouseover event
    /*var legendHolder = document.createElement('div');
    legendHolder.innerHTML = outChart.generateLegend();

    // When the series is mouseovered in the legend, highlight the corresponding elements
    helpers.each(legendHolder.firstChild.childNodes, function(legendNode, index){
    	helpers.addEvent(legendNode, 'mouseover', function(){
    	  switch(x.type){
          case "Bar":
    		    var activeBars = outChart.datasets[index].bars;
      			  for (var barsIndex = 0; barsIndex < activeBars.length; barsIndex++) {
        			  var activeBar = activeBars[barsIndex];
        				activeBar.save();
        				activeBar.fillColor = activeBar.highlightFill;
        				activeBar.strokeColor = activeBar.highlightStroke;
      				}
      				outChart.draw();

    			  break;
    			case "Pie":
    			case "PolarArea":
    			  var activeSegment = outChart.segments[index];
      		    activeSegment.save();
      			  activeSegment.fillColor = activeSegment.highlightColor;
      			  outChart.showTooltip([activeSegment]);
      			  activeSegment.restore();
      		break;
        }
    	});
    });
    		// Remove highlight after mouseout
    helpers.each(legendHolder.firstChild.childNodes, function(legendNode, index){
        helpers.addEvent(legendNode, 'mouseout', function(){
    	  switch(x.type){
          case "Bar":
      			var activeBars = outChart.datasets[index].bars;
      			for (var barsIndex = 0; barsIndex < activeBars.length; barsIndex++) {
        			var activeBar = activeBars[barsIndex];
        			activeBar.restore();
      			}
      			outChart.draw();
      			break;
    	  }
      });
    });

    canvas.parentNode.appendChild(legendHolder.firstChild);*/




  },

  resize: function(el, width, height, instance) {
    if (outChart)
      outChart.resize();
  }

});
