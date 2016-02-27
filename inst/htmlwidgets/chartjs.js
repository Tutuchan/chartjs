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

    // Handle options
    var chartOptions = x.options;
    console.log(chartOptions);
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
          type: x.type,
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

  },

  resize: function(el, width, height, instance) {
    if (instance.cjs)
      instance.cjs.resize();
  }

});
