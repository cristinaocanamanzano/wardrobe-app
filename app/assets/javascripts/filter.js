$(document).ready(function() {
  var $products = $('.grid-items'),
      $filters = $("#filters input[type='checkbox']"),
      product_filter = new ProductFilterLevel2($products, $filters);
  product_filter.init();
});

function ProductFilterLevel2(products, filters) {
  var _this = this;

  this.init = function() {
    this.products = products;
    this.filters = filters;
    this.bindEvents();
  };

  this.bindEvents = function() {
    this.filters.click(this.filterGridProducts);
    $('#clear_all').click(this.removeAllFilters);
  };

  this.filterGridProducts = function() {
    //hide all
    _this.products.hide();
    var filteredProducts =  _this.performFilteration(_this.products, $('.filter-attributes'));
    //show filtered
    filteredProducts.show();
  };

  this.removeAllFilters = function() {
    _this.filters.prop('checked', false);
    _this.products.show();
  };

  this.performFilteration = function(products, filterAttributes) {
    // for each attribute check the corresponding attribute filters selected
    var filteredProducts = products;
    filterAttributes.each(function(){
      var selectedFilters = $(this).find('input:checked');
      // if any filter selected
      if (selectedFilters.length) {
        filteredProducts = filteredProducts.filter(_this.getFilterString(selectedFilters));
      }
    });
    return filteredProducts;
  };

  this.getFilterString = function(selectedFilters) {
    var selectedFiltersValues = [];
    selectedFilters.each(function() {
      var currentFilter = $(this);
      selectedFiltersValues.push("[data-" + currentFilter.attr('name') + "='" + currentFilter.val() + "']");
    });
    return selectedFiltersValues.join(',');
  };
}
