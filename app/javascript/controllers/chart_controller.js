import { Controller } from "@hotwired/stimulus"
// Connects to data-controller="chart"
export default class extends Controller {
  static targets = [ "chart" ]
  static values = { topicNames: Array, topicData: Array }
  connect() {
    var myChart = new Chart(this.chartTarget, {
      type: 'bar',
      data: {
          labels: this.topicNamesValue,
          datasets: [{
              label: 'View 1: Coverage of topics',
              data: this.topicDataValue,
              backgroundColor: '#FFF4CE',
              borderColor: '#FFF4CE',
              borderRadius: 10
          }]
      },
options: {
     plugins: {
          title: {
              display: true,
              color: '#10212E',
              font: {
                  size: 24,
                  family: 'Poppins'
              }
          },
          legend: {
              display: false,
              labels: {
                  color: '#10212E',
                  font: {
                      size: 14,
                      family: 'Poppins'
              }
          }
         }
      },
    scales: {
        x: {
            grid: {
                display: true,
                color: '#10212E',
          },
            ticks: {
                  color: '#10212E',
                  font: {
                      size: 14,
                      family: 'Poppins'
                  }
              }
          },
        y: {
            grid: {
                display: true,
                color: '#10212E',
             },
            ticks: {
                  color: '#10212E',
                  font: {
                      size: 14,
                      family: 'Poppins'
              },
            beginAtZero: true
            }
        }
    }
}
});
  }
}
