jQuery(document).ready(function() {
    var alCities = ['Baltimore', 'Boston', 'New York', 'Tampa Bay', 'Toronto', 'Chicago', 'Cleveland', 'Detroit', 'Kansas City', 'Minnesota', 'Los Angeles', 'Oakland', 'Seattle', 'Texas'].sort();
    $('#demo').typeahead({source: alCities, items:5});
});