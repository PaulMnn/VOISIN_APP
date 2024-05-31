import { Controller } from "@hotwired/stimulus"
import flatpickr from "flatpickr";
import French  from "flatpickr/dist/l10n/fr.js"

export default class extends Controller {
  static values = {
    price: String
  }
  static targets = ["startDate", "endDate", 'itemPrice', 'totalPrice', 'days']
  connect() {
    [this.startDateTarget, this.endDateTarget].forEach((input) => {
      const startDate = this.startDateTarget
      const endDate = this.endDateTarget
      const price = this.priceValue
      const days = this.daysTarget
      const totalPriceTarget = this.totalPriceTarget
      flatpickr(input, {
        dateFormat: "d-m-Y",
        locale: French,
        onChange: function(selectedDates, dateStr, instance) {
          /* aller chercher le deuxième input */
          /* Prendre sa valeur */
          /* s'il n'a pas de date on return */
          /* faire la différence entre les 2 dates en jour et le stocker dans une const days */
          if(startDate.value && endDate.value) {
            // console.log('WORKS')
            const startValue = new Date(startDate.value)
            const endValue = new Date(endDate.value)
            // const total = end - start
            const diffTime = Math.abs(endValue - startValue);

            const diffDays = Math.floor((diffTime / (1000 * 60 * 60 * 24))/30) + 1;
            const totalPrice = diffDays * price
            days.innerHTML = `Nombre de jours: ${diffDays}`;
            totalPriceTarget.innerHTML = `Prix total: ${totalPrice.toFixed(2)} €`;
            // console.log(totalPrice)
            // days - price
          }
          // console.log(endDate.value)
          // console.log(price)
          /* aller cherche le prix de l'item */
          /* calculer prix * days et le stocker dans une const total */
          /* afficher le total sur la page */

      }
      });
    })
  }
}
