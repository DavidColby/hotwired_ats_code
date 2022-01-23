import ApplicationController from './application_controller'
import ApexCharts from "apexcharts"

export default class extends ApplicationController {
  static targets = ["chart"]

  static values = {
    labels: Array,
    series: Array
  }

  initialize() {
    this.chart = new ApexCharts(this.chartTarget, this.chartOptions);
    this.chart.render();
  }

  afterUpdate() {
    this.chart.updateOptions(this.chartOptions);
  }
}
