HTMLWidgets.widget({

  name: 'chartjs',

  type: 'output',

  initialize: function(el, width, height) {
    return {};
  },

  renderValue: function(el, x, instance) {
    //console.log(instance.cjs.generateLegend());
    helpers = Chart.helpers;

    var datasets = [];
    var data = [];
    console.log(x);

    // Final chart data
    data  = {
      labels: x.data.labels,
      datasets: x.data.datasets,
      legendTitle: x.legendTitle
    };

    console.log(data);

    // Get element in page
    var canvas = document.getElementById(el.id);
    var ctx = canvas.getContext("2d");

    // If a previous chart exists, destroy it
    if (instance.cjs) {
      instance.cjs.destroy();
      instance.cjs = null;
    }

    // Generate title if necessary
    if (canvas.parentNode.parentNode.firstChild.className === "chart-title"){
      canvas.parentNode.parentNode.firstChild.innerHTML = x.title;
    } else {
      var titleHolder = document.createElement('div');
      titleHolder.innerHTML = x.title;
      titleHolder.className = "chart-title";
      canvas.parentNode.parentNode.insertBefore(titleHolder, canvas.parentNode.parentNode.childNodes[0]);
    }

    // Handle options
    var chartOptions = x.options;
    //console.log(chartOptions);
    if (x.stacked){
      chartOptions.scales = {
        xAxes: [{
          stacked: true
        }],
        yAxes: [{
          stacked: true
        }]
      };
    }

    // Create actual chart
    instance.cjs = new Chart(ctx, {
          type: x.type.toLowerCase(),
          data: data,
          options: chartOptions
          });

    console.log(instance.cjs);
    // Generate legend. If it already exists, only modify the HTML.
    if (x.showLegend){
      if (canvas.parentNode.parentNode.children.length == 2){
        var legendHolder = document.createElement('div');
        console.log(instance.cjs.generateLegend());
        legendHolder.innerHTML = instance.cjs.generateLegend();
        canvas.parentNode.parentNode.appendChild(legendHolder.firstChild);
        console.log(legendHolder);
      } else {
        canvas.parentNode.nextElementSibling.className = x.type.toLowerCase().concat('-legend');
        canvas.parentNode.nextElementSibling.innerHTML = instance.cjs.generateLegend();
      }
    }


    // When the series is mouseovered in the legend, highlight the corresponding elements
    /*helpers.each(legendHolder.firstChild.childNodes, function(legendNode, index){
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
    if (instance.cjs)
      instance.cjs.resize();
  }

});
